From: Dave Hansen <dave.hansen@intel.com>
Date: Thu, 20 Apr 2023 15:15:58 -0700
Subject: [RFC 45/48] RISC-V: ioremap: Implement for arch specific ioremap
 hooks
In-Reply-To: <20230419221716.3603068-46-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
 <20230419221716.3603068-46-atishp@rivosinc.com>
Message-ID: <69ba1760-a079-fd8f-b079-fcb01e3eedec@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 4/19/23 15:17, Atish Patra wrote:
> The guests running in CoVE must notify the host about its mmio regions
> so that host can enable mmio emulation.

This one doesn't make a lot of sense to me.

The guest and host must agree about the guest's physical layout up
front.  In general, the host gets to dictate that layout.  It tells the
guest, up front, what is present in the guest physical address space.

This callback appears to say to the host:

	Hey, I (the guest) am treating this guest physical area as MMIO.

But the host and guest have to agree _somewhere_ what the MMIO is used
for, not just that it is being used as MMIO.



