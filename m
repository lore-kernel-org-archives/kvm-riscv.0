Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0619E67497
	for <kvm-riscv@archiver.kernel.org>; Mon, 22 Dec 2025 18:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cVtQG5RJF+hQrjH9SBp0/CrVl4zxjhnaElZvklotnpM=; b=z3VMt9SO1pp9CR
	yi7fZkcRnpNgxwoSsWiWrTTsXwbncBSq8SyDQE00vTo1xkyXivv3OGdrTJeR/cJRsZ1EiFOZnxHQN
	rrcoNcqCWNTIT712g/n+HP1zy0LeJlignOYvzhv13mTo4yAj8QH2rpT15UkcsaPy98Sl9HSzPHrwV
	I0zZjk9UQ7UIRMaRikvm6f6HeIBReiuqk/xNHobYcgpFmUpJCSQQNjlBbzs5glAu0tuPXz+1qtHqe
	ffRiO3UeK91U5/PROyh9KZCj4eVhDi5ybDGNo4HpQPEztiMlAlFfoxhBqPfeLTkkX9CVPguM6Kofq
	NKwNf7EWxE2dRse12eWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXkQ7-0000000E3aN-212A;
	Mon, 22 Dec 2025 18:14:11 +0000
Received: from out-170.mta0.migadu.com ([91.218.175.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXkQ4-0000000E3Zo-3iLY;
	Mon, 22 Dec 2025 18:14:10 +0000
Date: Mon, 22 Dec 2025 12:13:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766427242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zbdPyaZPt9HJuw5KayESUOdJwXP9h3ishpTKFDCnuOw=;
	b=mSmweQkezDjTlowvtfQ01ceqsPrAlzTD82wZ81Ff/00w8pOs5trd9BEiiRITc9iGRwWqQE
	U/PavRPG/J60U79SSPVmg4xwSrDn4IJoYOGYeQTXAHSpAXw8IwtCaDe2eKFVAII3U53+5c
	VessnowekdTgPsJucK4sOf+amI3vf58=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Fuad Tabba <tabba@google.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	will@kernel.org, pbonzini@redhat.com, shuah@kernel.org, anup@brainfault.org
Subject: Re: [PATCH v2 5/5] KVM: selftests: Fix typos and stale comments in
 kvm_util
Message-ID: <20251222-5d40dd87b6e6d0308ff1e900@orel>
References: <20251215165155.3451819-1-tabba@google.com>
 <20251215165155.3451819-6-tabba@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251215165155.3451819-6-tabba@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_101409_105005_06AF441B 
X-CRM114-Status: GOOD (  12.59  )
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

On Mon, Dec 15, 2025 at 04:51:55PM +0000, Fuad Tabba wrote:
> Fix minor documentation errors in `kvm_util.h` and `kvm_util.c`.
> 
> - Correct the argument description for `vcpu_args_set` in `kvm_util.h`,
>   which incorrectly listed `vm` instead of `vcpu`.
> - Fix a typo in the comment for `kvm_selftest_arch_init` ("exeucting" ->
>   "executing").
> - Correct the return value description for `vm_vaddr_unused_gap` in
>   `kvm_util.c` to match the implementation, which returns an address "at
>   or above" `vaddr_min`, not "at or below".
> 
> No functional change intended.
> 
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>  tools/testing/selftests/kvm/include/kvm_util.h | 4 ++--
>  tools/testing/selftests/kvm/lib/kvm_util.c     | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
