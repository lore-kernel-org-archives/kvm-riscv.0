From: Will Deacon <will@kernel.org>
Date: Fri, 6 May 2022 13:54:50 +0100
Subject: [RFC PATCH kvmtool 0/3] Add Sstc extension support
In-Reply-To: <20220304101023.764631-1-atishp@rivosinc.com>
References: <20220304101023.764631-1-atishp@rivosinc.com>
Message-ID: <20220506125450.GB22892@willie-the-truck>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 04, 2022 at 02:10:20AM -0800, Atish Patra wrote:
> This series adds Sstc extension which was ratified recently.
> 
> The first two patches adds the ISA extension framework which allows
> to define and update the DT for any multi-letter ISA extensions. 
> 
> The last patch just enables Sstc extension specifically if the hardware
> supports it.
> 
> The series can also be found at
> https://github.com/atishp04/kvmtool/tree/sstc_v1
> 
> The kvm & Qemu patches can be found at
> 
> KVM: https://github.com/atishp04/linux/tree/sstc_v2
> OpenSBI: https://github.com/atishp04/opensbi/tree/sstc_v1
> Qemu: https://github.com/atishp04/qemu/tree/sstc_v1 
> 
> [1] https://drive.google.com/file/d/1m84Re2yK8m_vbW7TspvevCDR82MOBaSX/view
> 
> Atish Patra (3):
> riscv: Update the uapi header as per Linux kernel
> riscv: Append ISA extensions to the device tree
> riscv: Add Sstc extension support

These look fine to me. What's the status of the kernel-side changes?

Will

