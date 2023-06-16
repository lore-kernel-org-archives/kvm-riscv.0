From: Conor Dooley <conor@kernel.org>
Date: Fri, 16 Jun 2023 19:28:05 +0100
Subject: [PATCH v2] riscv: kvm: define vcpu_sbi_ext_pmu in header
In-Reply-To: <20230616142203.168996-1-ben.dooks@codethink.co.uk>
References: <20230616142203.168996-1-ben.dooks@codethink.co.uk>
Message-ID: <20230616-army-portable-4b604631bc5a@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jun 16, 2023 at 03:22:03PM +0100, Ben Dooks wrote:
> Sparse is giving a warning about vcpu_sbi_ext_pmu not being
> defined, so add a definition to the relevant header to fix
> the following:
> 
> arch/riscv/kvm/vcpu_sbi_pmu.c:81:37: warning: symbol 'vcpu_sbi_ext_pmu' was not declared. Should it be static?
> 
> Fixes: cbddc4c4cb9e ("RISC-V: KVM: Add SBI PMU extension support")
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230616/6addc8cc/attachment.sig>
