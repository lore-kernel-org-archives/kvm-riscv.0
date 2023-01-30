From: Jeff Law <jlaw@ventanamicro.com>
Date: Mon, 30 Jan 2023 11:55:10 -0700
Subject: [PATCH v3 0/6] RISC-V: Apply Zicboz to clear_page
In-Reply-To: <20230130120128.1349464-1-ajones@ventanamicro.com>
References: <20230130120128.1349464-1-ajones@ventanamicro.com>
Message-ID: <5afd356d-7ed6-6f14-49be-246ff43d233f@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

[ Sorry for the duplicate.  Andrew indicated I'd used reply-list rather 
than reply-all.  ]


On 1/30/23 05:01, Andrew Jones wrote:
> When the Zicboz extension is available we can more rapidly zero naturally
> aligned Zicboz block sized chunks of memory. As pages are always page
> aligned and are larger than any Zicboz block size will be, then
> clear_page() appears to be a good candidate for the extension. While cycle
> count and energy consumption should also be considered, we can be pretty
> certain that implementing clear_page() with the Zicboz extension is a win
> by comparing the new dynamic instruction count with its current count[1].
> Doing so we see that the new count is just over a quarter of the old count
> (see patch4's commit message for more details).
> 
> For those of you who reviewed v1[2], you may be looking for the memset()
> patches. As pointed out in v1, and a couple follow-up emails, it's not
> clear that patching memset() is a win yet. When I get a chance to test
> on real hardware with a comprehensive benchmark collection then I can
> post the memset() patches separately (assuming the benchmarks show it's
> worthwhile).
> 
So a note.  On the userspace side we are using cboz for clearing memory 
in memset.  While the data is intermixed with other changes, there's a 
very significant drop in stores and a host of related low level 
performance counters and a notable uptick in gcc #5 performance from 
spec2017 which is particularly sensitive to memory clearing.  We haven't 
seen any performance regressions attributable to using cboz across 
spec2017's integer suite.

I believe our current threshold setting is to use cboz for chunks >= 128 
bytes.

Jeff

