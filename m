From: Conor Dooley <conor@kernel.org>
Date: Thu, 18 May 2023 18:31:37 +0100
Subject: [PATCH -next v20 23/26] riscv: Enable Vector code to be built
In-Reply-To: <20230518161949.11203-24-andy.chiu@sifive.com>
References: <20230518161949.11203-1-andy.chiu@sifive.com>
 <20230518161949.11203-24-andy.chiu@sifive.com>
Message-ID: <20230518-rented-jogging-b84c705f7d76@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, May 18, 2023 at 04:19:46PM +0000, Andy Chiu wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> This patch adds configs for building Vector code. First it detects the
> reqired toolchain support for building the code. Then it provides an
> option setting whether Vector is implicitly enabled to userspace.
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>

> Suggested-by: Conor Dooley <conor.dooley@microchip.com>>

You can drop this tag if you respin, I just provided review comments ;)
Also, it has an extra > at the end.

Otherwise, I am still not sold on the "default y", but we can always
flip it if there is in fact a regression.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230518/37ddcead/attachment.sig>
