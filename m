From: Conor Dooley <conor@kernel.org>
Date: Tue, 28 Feb 2023 22:07:49 -0000
Subject: [PATCH -next v14 02/19] riscv: Extending cpufeature.c to detect
 V-extension
In-Reply-To: <20230224170118.16766-3-andy.chiu@sifive.com>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
 <20230224170118.16766-3-andy.chiu@sifive.com>
Message-ID: <Y/57KguRXH4H5zDd@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 24, 2023 at 05:01:01PM +0000, Andy Chiu wrote:
> From: Guo Ren <ren_guo@c-sky.com>
> 
> Add V-extension into riscv_isa_ext_keys array and detect it with isa
> string parsing.
> 
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Suggested-by: Vineet Gupta <vineetg@rivosinc.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>

Looks grand, and thanks for switching to IS_ENABLED().
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230228/9c2560e5/attachment-0001.sig>
