import TableData from "@/components/tabledata";

export default function Home() {
  return (
    <div className="w-screen py-20 flex justify-center flex-col items-center bg-gray-300">
      <div className="flex items-center justify-between gap-1 mb-5">
        <h1 className="text-4xl font-bold">Next.js 14 Python Flask Mysql Pagination Next Prev | TailwindCSS DaisyUI</h1>
      </div>    
      <TableData/>
    </div>
  );
}