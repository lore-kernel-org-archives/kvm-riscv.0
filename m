From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 25 Jul 2023 09:47:14 +0530
Subject: [PATCH v3 0/7] Risc-V Kvm Smstateen
In-Reply-To: <20230724-scrap-pranker-7fd120078136@spud>
References: <20230724142033.306538-1-mchitale@ventanamicro.com> <20230724-scrap-pranker-7fd120078136@spud>
Message-ID: <CAK9=C2XXnQWqJgES2iWjatG9SFeFEUXZzLXz1gTYQ0aAh=7KJg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jul 24, 2023 at 10:08?PM Conor Dooley <conor@kernel.org> wrote:
>
> Hey Mayuresh,
>
> On Mon, Jul 24, 2023 at 07:50:26PM +0530, Mayuresh Chitale wrote:
> > This series adds support to detect the Smstateen extension for both, the
> > host and the guest vcpu. It also adds senvcfg and sstateen0 to the ONE_REG
> > interface and the vcpu context save/restore.
>
> There's not really an explanation in this series of where Smstateen is
> needed, or why it is only implemented for KVM. The spec mentions that this
> also applies to separate user threads, as well as to guests running in a
> hypervisor. As your first patch will lead to smstateen being set in
> /proc/cpuinfo, it could reasonably be assumed that the kernel itself
> supports the extension. Why does only KVM, and not the kernel, require
> support for smstateen?

Here's the motivation behind Smstateen from the spec:
"The implementation of optional RISC-V extensions has the potential to open
covert channels between separate user threads, or between separate guest
OSes running under a hypervisor. The problem occurs when an extension
adds processor state---usually explicit registers, but possibly other forms of
state---that the main OS or hypervisor is unaware of (and hence won?t
context-switch) but that can be modified/written by one user thread or
guest OS and perceived/examined/read by another."

Based on the above, Ssaia extension related CSRs need to be explicitly
enabled for HS-mode by M-mode (which OpenSBI already does) and
for VS-mode by HS-mode (which this series adds for KVM RISC-V).

Currently, there are no new extensions addings CSRs for user-space
so RISC-V kernel does not need to set up sstateenX CSRs for processes
or tasks but in the future RISC-V kernel might touch sstateenX CSRs.

Regards,
Anup

