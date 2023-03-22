From: Conor Dooley <conor@kernel.org>
Date: Wed, 22 Mar 2023 19:40:23 -0000
Subject: [PATCH 0/2] RISC-V: KVM: Require alternatives
In-Reply-To: <20230322192858.1189272-1-ajones@ventanamicro.com>
References: <20230322192858.1189272-1-ajones@ventanamicro.com>
Message-ID: <6d263b50-e2f0-4331-b930-c54e27f52fcc@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 22, 2023 at 08:28:56PM +0100, Andrew Jones wrote:
> KVM makes use of riscv_has_extension_unlikely() to check for the
> svinval extension. riscv_has_extension_unlikely() is built on
> alternatives, which means KVM should ensure alternatives support
> is available.
> 
> The first patch takes the opportunity to cleanup KVM's select
> list. The second patch selects RISCV_ALTERNATIVE.

Reminds me, I need to re-submit my patch doing that for the top-level
RISC-V Kconfig...
For the pair:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230322/5f47598b/attachment-0001.sig>
