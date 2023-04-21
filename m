From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Sat, 22 Apr 2023 00:54:41 +0530
Subject: [RFC 45/48] RISC-V: ioremap: Implement for arch specific ioremap hooks
In-Reply-To: <69ba1760-a079-fd8f-b079-fcb01e3eedec@intel.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com> <20230419221716.3603068-46-atishp@rivosinc.com>
 <69ba1760-a079-fd8f-b079-fcb01e3eedec@intel.com>
Message-ID: <CAHBxVyFhDapAeMQ8quBqWZ10jWSHw1CdE227ciyKQpULHYzffA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 21, 2023 at 3:46?AM Dave Hansen <dave.hansen@intel.com> wrote:
>
> On 4/19/23 15:17, Atish Patra wrote:
> > The guests running in CoVE must notify the host about its mmio regions
> > so that host can enable mmio emulation.
>
> This one doesn't make a lot of sense to me.
>
> The guest and host must agree about the guest's physical layout up
> front.  In general, the host gets to dictate that layout.  It tells the
> guest, up front, what is present in the guest physical address space.
>

That is passed through DT/ACPI (which will be measured) to the guest.

> This callback appears to say to the host:
>
>         Hey, I (the guest) am treating this guest physical area as MMIO.
>
> But the host and guest have to agree _somewhere_ what the MMIO is used
> for, not just that it is being used as MMIO.
>

Yes. The TSM (TEE Security Manager) which is equivalent to TDX also
needs to be aware
of the MMIO regions so that it can forward the faults accordingly.
Most of the MMIO is emulated in the host (userspace or kernel
emulation if present).
The host is outside the trust boundary of the guest. Thus, guest needs
to make sure the host
only emulates the designated MMIO region. Otherwise, it opens an
attack surface from a malicious host.

All other confidential computing solutions also depend on guest
initiated MMIO as well. AFAIK, the TDX & SEV
relies on #VE like exceptions to invoke that while this patch is
similar to what pkvm does.
This approach lets the enlightened guest control which MMIO regions it
wants the host to emulate.
It can be a subset of the region's host provided the layout. The guest
device filtering solution is based on
this idea as well [1].

[1] https://lore.kernel.org/all/20210930010511.3387967-1-sathyanarayanan.kuppuswamy at linux.intel.com/


>

