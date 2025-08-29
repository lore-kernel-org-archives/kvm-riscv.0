Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8817ACA0FF9
	for <kvm-riscv@archiver.kernel.org>; Sat, 30 Aug 2025 00:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hub4YsLY+/WRUv/60d464Jwc8ZXJrJFaMLX2QqmBFVo=; b=y09/HOlDSRXukQ
	uy13qFM0TETBQTJ8tL9+a4h9FauIzBxIgzeRMtlKi4eO4dw5SwSscz0dLqXOXWJ+Gzv+RLpEeb1zw
	m6uGqvM6EXqJ6XC20yUKRIqgbNfsE4Svt+PdtmpCsGZE7tx3tPrlrtpcjjOGyXBkrf6ZCjUsbS9uK
	xesE5Aar/xssOo+sG/Hf84fD7l2tACehgLuCJAiR1XX0UVoCFXOvUPHE+mhpz+WIva3o56eWl9b/g
	DeZWGVqnEKiMNVyAlvfqhKkz0aqghRHa7iq7bo298rwkXMgRYFBgzzSi5oy6HHCxAtxUZkhIvBlhM
	1ggsWtOPBy13UAHoWFdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9nz-00000007Blb-0mpk;
	Sat, 30 Aug 2025 00:50:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us3zP-00000006ekr-1i0N;
	Fri, 29 Aug 2025 18:38:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 78B0660147;
	Fri, 29 Aug 2025 18:38:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 838E8C4CEF0;
	Fri, 29 Aug 2025 18:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756492698;
	bh=G2OtD6gg+bw9ZqOkq99RiwmobzpQGmczBt388tEvqQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ov5WnNhDYY/E6a4awYJM+K8xgExCClE5Y0Tf2Y11//SUqC2e8H33VSZ3i1uc1POtL
	 3YeCHPT+LRLLcXNmGQk3C5oHa7zsZ0bofiQBgc3pMXL6VH0tJuaARC3EPbSqo4icNK
	 2wfmzXZxZK8E2DR8zjmoS3hnPuPIA3PoPtUqF3bYgIyCzxtY0eWIORQko0EVjTH3+9
	 ZfDkkyLHld0blZUJ+7o4K80ZpSREI4kfSUqIc7jMHAmBsnDS9BGcDpLvn6Kaz95vU6
	 U4WSMzFdzrnSt8Z0481GORe3zvOMdHZ8W4AuagPsc8gBnpvZu0IxNoyLS2Jq773s7J
	 3OXrT9D8lO56A==
Date: Fri, 29 Aug 2025 18:38:16 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, loongarch@lists.linux.dev,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-hyperv@vger.kernel.org, rcu@vger.kernel.org,
	Nuno Das Neves <nunodasneves@linux.microsoft.com>,
	Mukesh R <mrathor@linux.microsoft.com>, ssengar@linux.microsoft.com,
	namjain@linux.microsoft.com
Subject: Re: [PATCH v2 2/7] Drivers: hv: Disentangle VTL return cancellation
 from SIGPENDING
Message-ID: <aLHzmBFuWy2P5Opq@liuwe-devbox-ubuntu-v2.tail21d00.ts.net>
References: <20250828000156.23389-1-seanjc@google.com>
 <20250828000156.23389-3-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250828000156.23389-3-seanjc@google.com>
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Aug 27, 2025 at 05:01:51PM -0700, Sean Christopherson wrote:
> Check for return to a lower VTL being cancelled separately from handling
> pending TIF-based work, as there is no need to immediately process pending
> work; the kernel will immediately exit to userspace (ignoring preemption)
> and handle the pending work at that time.
> 
> Disentangling cancellation from the TIF-based work will allow switching to
> common virtualization APIs for detecting and processing pending work.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Thanks for this patch, Sean.

My current plan is to drop this driver from my tree (hence it will
disappear from linux-next soon) because Peter has an objection to the
ABI it introduces. I just have not gotten around to it yet.

I won't apply this patch, the next one and the last one. I have CC'ed
the owner of that driver to this patch here so that your suggestion can
be incorporated in future submissions.

CC Saurabh and Naman.

Thanks,
Wei

> ---
>  drivers/hv/mshv_vtl_main.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hv/mshv_vtl_main.c b/drivers/hv/mshv_vtl_main.c
> index 12f5e77b7095..aa09a76f0eff 100644
> --- a/drivers/hv/mshv_vtl_main.c
> +++ b/drivers/hv/mshv_vtl_main.c
> @@ -731,19 +731,21 @@ static int mshv_vtl_ioctl_return_to_lower_vtl(void)
>  						_TIF_NOTIFY_RESUME | _TIF_NOTIFY_SIGNAL |
>  						_TIF_NEED_RESCHED_LAZY;
>  		unsigned long ti_work;
> -		u32 cancel;
>  		unsigned long irq_flags;
>  		struct hv_vp_assist_page *hvp;
>  		int ret;
>  
>  		local_irq_save(irq_flags);
> +		if (READ_ONCE(mshv_vtl_this_run()->cancel)) {
> +			local_irq_restore(irq_flags);
> +			preempt_enable();
> +			return -EINTR;
> +		}
> +
>  		ti_work = READ_ONCE(current_thread_info()->flags);
> -		cancel = READ_ONCE(mshv_vtl_this_run()->cancel);
> -		if (unlikely((ti_work & VTL0_WORK) || cancel)) {
> +		if (unlikely(ti_work & VTL0_WORK)) {
>  			local_irq_restore(irq_flags);
>  			preempt_enable();
> -			if (cancel)
> -				ti_work |= _TIF_SIGPENDING;
>  			ret = mshv_do_pre_guest_mode_work(ti_work);
>  			if (ret)
>  				return ret;
> -- 
> 2.51.0.268.g9569e192d0-goog
> 
> 

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
