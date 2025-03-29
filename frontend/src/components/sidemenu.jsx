function Sidemenu () {
    return (
        <>
            <div className="fixed pt-[90px] bg-[#2E2F2F] w-[20%] h-[100vh] sm:hidden md:hidden lg:block" data-aos="fade-right" data-aos-easing="linear" data-aos-duration="1500">
                <aside className="text-white">
                    <ul className="space-y-[10px] text-[19px]">
                        <li className="hover:bg-gray-800 hover:py-[10px] py-[10px] pl-[20px] hover:w-[90%] hover:pl-[20px]"><a href="/reels">Watch</a></li>
                        <li className="hover:bg-gray-800 hover:py-[10px] py-[10px] pl-[20px] hover:w-[90%] hover:pl-[20px]"><a href="/pool">Pools</a></li>
                        <li className="hover:bg-gray-800 hover:py-[10px] py-[10px] pl-[20px] hover:w-[90%] hover:pl-[20px]"><a href="/earn">Earn</a></li>
                    </ul>
                </aside>
            </div>
    
        </>
    )
}
export default Sidemenu