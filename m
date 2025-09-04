Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A94C7CA101C
	for <kvm-riscv@archiver.kernel.org>; Fri,  5 Sep 2025 02:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DAvdTjzZC0rLPSz83RLKU43OiHTngY6pqw9b6wxNIfE=; b=yVyRmnXkEiSMab
	rf8CuYVUIdOfYnr+hj++T/gMU1cfEJmz58fNG85lIMNvkS8Zil78wmh3ec/4MpXHbnQf6U/227F4f
	gopFwagYWYHJlpV1jetVDUZTiS3UZASX+hSEPlJeBcx8zBkwcKVXPFZxhdEwTZ4eC91tEDRJWw2Ze
	VyhAp2cc3rp6odFzwELKbxO157ytcalK6MzqQI2fk6L1QmnepTD1NfmT9C6L9DXnTlEZrv7zB18MF
	FsuEokOom/3PsUrD2gw7rcX1ET2BumQHLJyGJ4oBYNqmhupKkHCProthZQZ9z4/E6OJZeyoNyadot
	ATag5YilLN76r8rDzzGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM6c-0000000G5le-0lIq;
	Fri, 05 Sep 2025 02:23:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuJa7-0000000FBvh-0QAw;
	Thu, 04 Sep 2025 23:41:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3BC1A43234;
	Thu,  4 Sep 2025 23:41:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A26EC4CEF0;
	Thu,  4 Sep 2025 23:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757029289;
	bh=FXSCx6Zola7pSIKISL/TTWzUvg3jHW6dDupjOWBR9lE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dGFEfNiSpDwfJ33AtkShNPM078gopMDZtzNhmg6Vx1TpHFUOEvHE+k+nQY+CIaWt5
	 ldWncxa93/0mE3j+f0i1Zf9yrOAJ+75RyW+J1YwN9tXAIyt16lM0sjyPFDPMbSNME9
	 iAWsaSqDPvNGQEzmBsNdR6uepNSln8tH6NyayMc2Hs5KL//qxSgb18Q53qhXSKKTs6
	 m1as719tex5fuOBePlRAFY6+mm5bWvyJ9wGVFmA8ooOZOzSAGKCmC9nu1o09XoeMOK
	 dHazGYMYzfoQcWMEFYNS67lV9mMee8b+DdnvMtqZmWlNl7GJ16FSdXhv+Mq5nHvjJE
	 LI6S0TEtEv4Xg==
Date: Thu, 4 Sep 2025 23:41:27 +0000
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
	Mukesh R <mrathor@linux.microsoft.com>
Subject: Re: [PATCH v2 0/7] Drivers: hv: Fix NEED_RESCHED_LAZY and use common
 APIs
Message-ID: <aLojpyTwAMdb1z6D@liuwe-devbox-ubuntu-v2.lamzopl0uupeniq2etz1fddiyg.xx.internal.cloudapp.net>
References: <20250828000156.23389-1-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250828000156.23389-1-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_164131_180998_44466D19 
X-CRM114-Status: GOOD (  21.27  )
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

On Wed, Aug 27, 2025 at 05:01:49PM -0700, Sean Christopherson wrote:
> Fix a bug where MSHV root partitions (and upper-level VTL code) don't honor
> NEED_RESCHED_LAZY, and then deduplicate the TIF related MSHV code by turning
> the "kvm" entry APIs into more generic "virt" APIs.
> 
> This version is based on
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git hyperv-next
> 
> in order to pickup the VTL changes that are queued for 6.18.  I also
> squashed the NEED_RESCHED_LAZY fixes for root and VTL modes into a single
> patch, as it should be easy/straightforward to drop the VTL change as needed
> if we want this in 6.17 or earlier.
> 
> That effectively means the full series is dependent on the VTL changes being
> fully merged for 6.18.  But I think that's ok as it's really only the MSHV
> changes that have any urgency whatsoever, and I assume that Microsoft is
> the only user that truly cares about the MSHV root fix.  I.e. if the whole
> thing gets delayed, I think it's only the Hyper-V folks that are impacted.
> 
> I have no preference what tree this goes through, or when, and can respin
> and/or split as needed.
> 
> As with v1, the Hyper-V stuff and non-x86 architectures are compile-tested
> only.
> 
> v2:
>  - Rebase on hyperv-next.
>  - Fix and converge the VTL code as well. [Peter, Nuno]
> 
> v1: https://lore.kernel.org/all/20250825200622.3759571-1-seanjc@google.com
> 

I dropped the mshv_vtl changes in this series and applied the rest
(including the KVM changes) to hyperv-next.

Thanks,
Wei

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
