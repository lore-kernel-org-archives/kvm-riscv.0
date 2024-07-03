From: Palmer Dabbelt <palmer@rivosinc.com>
Date: Wed, 03 Jul 2024 12:59:14 -0700 (PDT)
Subject: [PATCH v4 0/3] Assorted fixes in RISC-V PMU driver
In-Reply-To: <20240701130127.GA2250@willie-the-truck>
Message-ID: <mhng-c9cb22ea-9f7c-44c2-8e3c-8bd1de101e16@palmer-ri-x1c9>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 01 Jul 2024 06:01:27 PDT (-0700), Will Deacon wrote:
> On Fri, Jun 28, 2024 at 12:51:40AM -0700, Atish Patra wrote:
>> This series contains 3 fixes out of which the first one is a new fix
>> for invalid event data reported in lkml[2]. The last two are v3 of Samuel's
>> patch[1]. I added the RB/TB/Fixes tag and moved 1 unrelated change
>> to its own patch. I also changed an error message in kvm vcpu_pmu from
>> pr_err to pr_debug to avoid redundant failure error messages generated
>> due to the boot time quering of events implemented in the patch[1]
>
> I'm assuming this series will go via the riscv arch tree, but please
> shout if that's not the case.

Ya, it just ended up dragging on a bit because of a missing DCO.  I'm 
just throwing it at the tester now, it should show up on fixes 
eventually...

