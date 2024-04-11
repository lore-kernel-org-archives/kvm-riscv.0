From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 11 Apr 2024 09:45:19 +0200
Subject: [PATCH v5 06/22] drivers/perf: riscv: Implement SBI PMU snapshot
 function
In-Reply-To: <170cc87a-5b55-45be-a0de-213aabd852dc@rivosinc.com>
References: <20240403080452.1007601-1-atishp@rivosinc.com>
 <20240403080452.1007601-7-atishp@rivosinc.com>
 <20240404-4303d1805800fad18b6d9768@orel>
 <170cc87a-5b55-45be-a0de-213aabd852dc@rivosinc.com>
Message-ID: <20240411-688dc97b08bb3b63511dcf6e@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 10, 2024 at 03:29:21PM -0700, Atish Patra wrote:
> On 4/4/24 04:52, Andrew Jones wrote:
> > On Wed, Apr 03, 2024 at 01:04:35AM -0700, Atish Patra wrote:
...
> > > +static int pmu_sbi_snapshot_disable(void)
> > > +{
> > > +	struct sbiret ret;
> > > +
> > > +	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_SNAPSHOT_SET_SHMEM, -1,
> > > +			-1, 0, 0, 0, 0);
> > > +	if (ret.error) {
> > > +		pr_warn("failed to disable snapshot shared memory\n");
> > > +		return sbi_err_map_linux_errno(ret.error);
> > > +	}
> > 
> > Also need to set snapshot_set_done to false, but I'm not yet convinced
> 
> Done.
> 
> > that we need snapshot_set_done, especially if we don't allow
> > snapshot_addr_phys to be zero, since zero can then mean set-not-done,
> > but ~0UL is probably a better invalid physical address choice than zero.
> > 
> 
> Agreed. But I don't see any benefit either way. snapshot_set_done is just
> more explicit way of doing the same thing without interpreting what zero
> means.
> 
> If you think there is a benefit or you feel storngly about it, I can change
> it you suggested approach.
>

I don't have a strong opinion on it. I'm just reluctant to add redundant
state, not only because it increases size, but also because we have to
keep track of it, like in the example above, where we needed to remember
to reset the extra state to false.

Of course, giving invalid addresses additional meanings also comes with
its own code maintenance trade-offs, so either way...

Thanks,
drew

