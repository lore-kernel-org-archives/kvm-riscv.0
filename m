From: Conor Dooley <conor@kernel.org>
Date: Mon, 5 Jun 2023 17:04:08 +0100
Subject: [PATCH -next v21 11/27] riscv: Allocate user's vector context in
 the first-use trap
In-Reply-To: <20230605110724.21391-12-andy.chiu@sifive.com>
References: <20230605110724.21391-1-andy.chiu@sifive.com>
 <20230605110724.21391-12-andy.chiu@sifive.com>
Message-ID: <20230605-creme-smugly-e7592c870dda@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jun 05, 2023 at 11:07:08AM +0000, Andy Chiu wrote:
> Vector unit is disabled by default for all user processes. Thus, a
> process will take a trap (illegal instruction) into kernel at the first
> time when it uses Vector. Only after then, the kernel allocates V
> context and starts take care of the context for that user process.
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Link: https://lore.kernel.org/r/3923eeee-e4dc-0911-40bf-84c34aee962d at linaro.org
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---
> Changelog v21:
>  - Remove has_vector() and use ELF_HWCAP instead. The V bit in the hwcap,
>    if preesents, implies has_vector() returning true. So we can drop
>    has_vector() test here safely, because we also don't handle !V but
>    has_vector() cases.

I think you could probably have carried my R-b from v20, but I realise I
did not reply to you - sorry about that.
The removal of the has_vector() check seems to tally with the
conversation we had on v20, so
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230605/daa8c1a8/attachment-0001.sig>
