Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA022E77182
	for <kvm-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 22:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eIeluSeVJcTzPykY4eJtexZNsKY5ZAx0fwgDa1ObEL4=; b=WwgM0BdeBTpDMj
	cshtZF+BNKCi/4uKPdKvCq90Dq7tTfBLA2Fb+J9V+ofXtt1NV1DS28FFk1qgB41kY7fT4IJRVdsGF
	5AnZ5LHGS2dt/wyFbT1dHlXcO5e1KjU3RR41AR9MSYi+v28lRF3XNmCURIKKiswe6lHxfhwKBUNrj
	BhZtQHFnpJ/IZS8Wdb8YShhUBTTCQJGX2clkeRLIGcAG/0NagOyyFGMhAhlSlQOHz2yOpDxjtdYZP
	QkXthayLvxBttHoxxTIoStYshuuOFlumd7ArQizkCRmPG4aDAQpkYGhLS4xU3Pf4UdRd/MI3WdZTo
	/QfWGXbwseM1AGUVA/Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVFj-0000000GKMl-2IAd;
	Wed, 11 Dec 2024 22:32:19 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVFg-0000000GKJU-3QJu;
	Wed, 11 Dec 2024 22:32:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BDB65A41D76;
	Wed, 11 Dec 2024 22:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0BF6C4CED2;
	Wed, 11 Dec 2024 22:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733956335;
	bh=awhd+qYBZdWAIqJRcAxRI8ocm3yOwTpT8RsZsQR3PAk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=RDlVokYh0l4AVx9EUxhtB7Pl4dZihyS9aPE4663P+x5ykYHBIc9Ir1CrrdeDXtzsp
	 iwQwrJx/XOQMKP3c7yqhem1/iuE6FN0OUfXvl0ipFE42Hhea+t+EqAkvqFCjYqNGyR
	 KCZnki4f6Pqba1ciquWr69X8whEgMReywX3iFv3/dpNSOczT8LePmK+pmflbCq86BK
	 nCkOguK4Mf3Xb9+0/gJTuirhA9N+uawZaztOziKAnOUhyHKobudckD0JSnzr7HFzyD
	 vvd0EPNUT6ie9EfVyom9Ue5ajs3C2ICsPvYKbY2faMDnnksBMPkcVWSVZTbwLPQ4Os
	 N4V4Z9+pQUc0g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34141380A965;
	Wed, 11 Dec 2024 22:32:33 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v8 0/5] Add Svade and Svadu Extensions Support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173395635176.1729195.3092998721998204770.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 22:32:31 +0000
References: <20240726084931.28924-1-yongxuan.wang@sifive.com>
In-Reply-To: <20240726084931.28924-1-yongxuan.wang@sifive.com>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, greentime.hu@sifive.com,
 vincent.chen@sifive.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_143216_925465_79264644 
X-CRM114-Status: GOOD (  11.92  )
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

Hello:

This series was applied to riscv/linux.git (fixes)
by Anup Patel <anup@brainfault.org>:

On Fri, 26 Jul 2024 16:49:25 +0800 you wrote:
> Svade and Svadu extensions represent two schemes for managing the PTE A/D
> bit. When the PTE A/D bits need to be set, Svade extension intdicates that
> a related page fault will be raised. In contrast, the Svadu extension
> supports hardware updating of PTE A/D bits. This series enables Svade and
> Svadu extensions for both host and guest OS.
> 
> Regrading the mailing thread[1], we have 4 possible combinations of
> these extensions in the device tree, the default hardware behavior for
> these possibilities are:
> 1) Neither Svade nor Svadu present in DT => It is technically
>    unknown whether the platform uses Svade or Svadu. Supervisor
>    software should be prepared to handle either hardware updating
>    of the PTE A/D bits or page faults when they need updated.
> 2) Only Svade present in DT => Supervisor must assume Svade to be
>    always enabled.
> 3) Only Svadu present in DT => Supervisor must assume Svadu to be
>    always enabled.
> 4) Both Svade and Svadu present in DT => Supervisor must assume
>    Svadu turned-off at boot time. To use Svadu, supervisor must
>    explicitly enable it using the SBI FWFT extension.
> 
> [...]

Here is the summary with links:
  - [v8,1/5] RISC-V: Add Svade and Svadu Extensions Support
    https://git.kernel.org/riscv/c/94a7734d0967
  - [v8,2/5] dt-bindings: riscv: Add Svade and Svadu Entries
    https://git.kernel.org/riscv/c/b8d481671703
  - [v8,3/5] RISC-V: KVM: Add Svade and Svadu Extensions Support for Guest/VM
    https://git.kernel.org/riscv/c/97eccf7db4f2
  - [v8,4/5] KVM: riscv: selftests: Fix compile error
    (no matching commit)
  - [v8,5/5] KVM: riscv: selftests: Add Svade and Svadu Extension to get-reg-list test
    https://git.kernel.org/riscv/c/c74bfe4ffe8c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
