Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E53C3600E
	for <kvm-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 03:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f59sk8H3G0coVemRlhynK2dTGq4dDZLuA98rlkYWK4M=; b=qmCEAEfO71eDKe
	gS9/10kBIyD5KtA8W56XFr9E7pF0ffPhiQU0erwiRhfcfVgnp8CUF3zu6lKWwK5rErW4EXC2N3zTH
	WdbEGuyMrn+NtTWqlWR2oeuQ1887Xa5aov9WaSFtBsFjyz653iue2aNabzmnmqDbz7qqelmFGx6L9
	7ZAfUydZVuRiZwz9Ns7SyDmiLMlAKgFK102rtHXDF1WjgEnZd5RVck07exo3OnEUrbJwLJX2RlhEd
	WsQxlg/62NVHUatsJgvdnECDykNYS1Mn15wzZfghm72cM4lTPSYFLTTbl8MK1HYs74BOySxA3OYRC
	mJpTOnT9PTmulG1C+7eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txdqt-0000000A4Kk-27wO;
	Thu, 27 Mar 2025 03:24:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txdqp-0000000A4Ef-1oxo;
	Thu, 27 Mar 2025 03:24:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E43675C6AA9;
	Thu, 27 Mar 2025 03:21:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DA39C4CEE4;
	Thu, 27 Mar 2025 03:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045854;
	bh=s6pd1Oapn/Xfy41cHLXqSj8prrh5zDyVA8M/EDhHlgs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hfRxvIVKwgGJtyuPK+0oKDZSb1KxlnOVeIBJeZhSNGuI6H7h+9gUTo4PcGPhdxLz0
	 WtSiWr9hZkY/nCNREHOe0XclKw81ICoJoJOW2Ie4e8QLZXBm6S1ticvtHeEjrVShnh
	 pFF0aqqmo5X/DEUMTYiMD4zOUoq0QRSS0ea2cDhI5D+i0nORrbqk+5/pRH22wf8ht0
	 CCxPN0cHXLUKJfY2QO7p/89YsXkOQNN/y2FQXYbELDLqK+cg1Vjz/+/ywwg1/z+Stu
	 CfR5wuqZmO7whx31SbbxG/vh5bPozAWcx5ReazxhtNheknvmCyQBhyZHavbBCXnLfW
	 21MVAcUn/gYtQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33BEA380AAFD;
	Thu, 27 Mar 2025 03:24:52 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: KVM: Remove unnecessary vcpu kick
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174304589076.1549280.903710261634215317.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 03:24:50 +0000
References: <20250221104538.2147-1-xiangwencheng@lanxincomputing.com>
In-Reply-To: <20250221104538.2147-1-xiangwencheng@lanxincomputing.com>
To: BillXiang <xiangwencheng@lanxincomputing.com>
Cc: linux-riscv@lists.infradead.org, anup@brainfault.org,
 ajones@ventanamicro.com, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, atishp@atishpatra.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 rkrcmar@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_202415_538700_35C81F44 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
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

This patch was applied to riscv/linux.git (for-next)
by Anup Patel <anup@brainfault.org>:

On Fri, 21 Feb 2025 18:45:38 +0800 you wrote:
> Remove the unnecessary kick to the vCPU after writing to the vs_file
> of IMSIC in kvm_riscv_vcpu_aia_imsic_inject.
> 
> For vCPUs that are running, writing to the vs_file directly forwards
> the interrupt as an MSI to them and does not need an extra kick.
> 
> For vCPUs that are descheduled after emulating WFI, KVM will enable
> the guest external interrupt for that vCPU in
> kvm_riscv_aia_wakeon_hgei. This means that writing to the vs_file
> will cause a guest external interrupt, which will cause KVM to wake
> up the vCPU in hgei_interrupt to handle the interrupt properly.
> 
> [...]

Here is the summary with links:
  - [v2] riscv: KVM: Remove unnecessary vcpu kick
    https://git.kernel.org/riscv/c/d252435aca44

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
