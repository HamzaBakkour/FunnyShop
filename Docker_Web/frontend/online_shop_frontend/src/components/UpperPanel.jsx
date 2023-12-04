import Search from './Search';
import Categories from "../components/Categories";


function UpperPanel(){


    return (
        <div className="container d-flex flex-column px-0 mb-0">
            <div className="row">
                <video
                style={{height: '100vh',
                        width: '100%',
                        objectFit: 'fill'}}
                        autoPlay
                        loop
                        muted>
                    <source
                    src = {"https://funnyshop-backend-media.s3.eu-north-1.amazonaws.com/funnyShop-react-media/video_2.mp4"}
                    type = 'video/mp4' />
                </video>

                <div className="d-flex flex-column   justify-content-end align-items-center"
            style={{
            position: 'relative',
            top: '-15%',
            marginBottom: '-90px'
        }}
            >
                <Search />
                <Categories />
            </div>
            </div>
        </div>
    )
}


export default UpperPanel;
