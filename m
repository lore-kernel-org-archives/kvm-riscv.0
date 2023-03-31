From: Heiko Stübner <heiko@sntech.de>
Date: Fri, 31 Mar 2023 15:43:44 +0200
Subject: [PATCH -next v17 15/20] riscv: signal: validate altstack to reflect
 Vector
In-Reply-To: <20230327164941.20491-16-andy.chiu@sifive.com>
References: <20230327164941.20491-1-andy.chiu@sifive.com>
 <20230327164941.20491-16-andy.chiu@sifive.com>
Message-ID: <2623949.BddDVKsqQX@diego>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Am Montag, 27. M?rz 2023, 18:49:35 CEST schrieb Andy Chiu:
> Some extensions, such as Vector, dynamically change footprint on a
> signal frame, so MINSIGSTKSZ is no longer accurate. For example, an
> RV64V implementation with vlen = 512 may occupy 2K + 40 + 12 Bytes of a
> signal frame with the upcoming support. And processes that do not
> execute any vector instructions do not need to reserve the extra
> sigframe. So we need a way to guard the allocation size of the sigframe
> at process runtime according to current status of V.
> 
> Thus, provide the function sigaltstack_size_valid() to validate its size
> based on current allocation status of supported extensions.
> 
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>




