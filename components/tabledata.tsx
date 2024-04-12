"use client";

import React, { useEffect, useState } from "react";
import axios from 'axios' //npm install axios https://www.npmjs.com/package/axios
import Image from 'next/image' 

export default function Users() {
    const [products, setProducts] = useState([]);
    const [info, setInfo] = useState({});

    const url = "http://127.0.0.1:5000/products/1/3";

    useEffect(() => {
        fetchProducts(url);
    }, []);

    const fetchProducts = (url) => {
        axios
        .get(url)
        .then((data) => {
            setProducts(data.data.results);
            //console.log(data.data.results);
            setInfo(data.data);
            //console.log(data.data);
        })
        .catch((error) => {
            console.log(error);
        });
    };

    const handleNextPage = () => {
        fetchProducts(info.next_page_url);
        window.scrollTo(0, 0);
    };
    
    const handlePreviousPage = () => {
        fetchProducts(info.prev_page_url);
        window.scrollTo(0, 0);
    };

    return (
            <div className="py-16">
            <div className="container mx-auto px-4">
                <h2 className="text-3xl font-bold text-white mb-8">Introducing Our Latest Product</h2>
                <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
                
                {products.map((item, index) => (
                <div key={index} className="bg-white rounded-lg shadow-lg p-8">
                    <div className="relative overflow-hidden">
                        <Image
                        src={`http://127.0.0.1:5000/static/images/${item.image}`}
                        width={400}
                        height={400}
                        alt="Photo"
                        />
                    <div className="absolute inset-0 bg-black opacity-40" />
                    <div className="absolute inset-0 flex items-center justify-center">
                        <button className="bg-white text-gray-900 py-2 px-6 rounded-full font-bold hover:bg-gray-300">View Product</button>
                    </div>
                    </div>
                    <h3 className="text-xl font-bold text-gray-900 mt-4">{item.name}</h3>
                    <p className="text-gray-500 text-sm mt-2">Description: {item.name}</p>
                    <div className="flex items-center justify-between mt-4">
                    <span className="text-gray-900 font-bold text-lg">${item.price}.99</span>
                    <button className="bg-gray-900 text-white py-2 px-4 rounded-full font-bold hover:bg-gray-800">Add to Cart</button>
                    </div>
                </div>
                ))}

                </div>
                <div className="w-1/2 items-center px-4 mt-6">   
                    <div className="join grid grid-cols-2">
                        {info.prev_page_url ? (
                            <button className="join-item btn btn-primary btn-outline" onClick={handlePreviousPage}>
                            Previous
                            </button>
                        ) : null}
                        {info.next_page_url ? (
                            <button className="join-item btn btn-primary btn-outline" onClick={handleNextPage}>
                            Next
                            </button>
                        ) : null}
                    </div>
                </div> 
            </div>
            </div>
  );
}