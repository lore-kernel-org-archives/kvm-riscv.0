From: Conor Dooley <conor@kernel.org>
Date: Mon, 24 Jul 2023 17:38:46 +0100
Subject: [PATCH v3 0/7] Risc-V Kvm Smstateen
In-Reply-To: <20230724142033.306538-1-mchitale@ventanamicro.com>
References: <20230724142033.306538-1-mchitale@ventanamicro.com>
Message-ID: <20230724-scrap-pranker-7fd120078136@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hey Mayuresh,

On Mon, Jul 24, 2023 at 07:50:26PM +0530, Mayuresh Chitale wrote:
> This series adds support to detect the Smstateen extension for both, the
> host and the guest vcpu. It also adds senvcfg and sstateen0 to the ONE_REG
> interface and the vcpu context save/restore.

There's not really an explanation in this series of where Smstateen is
needed, or why it is only implemented for KVM. The spec mentions that this
also applies to separate user threads, as well as to guests running in a
hypervisor. As your first patch will lead to smstateen being set in
/proc/cpuinfo, it could reasonably be assumed that the kernel itself
supports the extension. Why does only KVM, and not the kernel, require
support for smstateen?

Thanks,
Conor.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230724/412e56ab/attachment.sig>
