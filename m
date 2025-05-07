Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D25EC3ABC5
	for <kvm-riscv@archiver.kernel.org>; Wed,  7 May 2025 17:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5LMnzxy55ru7nKw6PPTE272PRy666V5jlPu6f/fHsrQ=; b=UitRnGyW/IqSXC
	0M8edEmGwa3PYUvDLY/nlc8F2pzfViIaDYNHfor42XbuKhAKvxBEIPu6Dr8MbDSAdcUT/K3Ud9NtO
	ph3VJ1lnJdWZcmgS+rHSTemm/s3H/e8ulLsUpVW3DjsUP2fd4MeyXT6bCTHj83C8DnWYoIsYLlVf1
	4ZKqUKry3J5zh7QJcLixpR4hakuC0+46mJO/ni8OsW3H8WWOit6dAf+e9XVE8HOME1gB5HRXWtJaC
	06so8cxvEiapsLW/E/P2N9ko/mgH8W+asXJ/+V3PW2vNJ5uajzQ3DZaqh3gZutgD3wZevKE78M+KG
	ku9yGWQ7k9Cqvgesltcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiXc-0000000GJvP-09gU;
	Wed, 07 May 2025 17:26:44 +0000
Received: from out-182.mta1.migadu.com ([95.215.58.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uChnZ-0000000GBTM-2Ptq
	for kvm-riscv@lists.infradead.org;
	Wed, 07 May 2025 16:39:11 +0000
Date: Wed, 7 May 2025 18:38:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746635944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Zb+SGIpxZ2i/VssN+N0+bs8AQInuxHpANS0MYc/FZCk=;
	b=cdBlN5NpDyu9tl5cWVL01+s2VGA+1OQ7iBEbZ7+NGpnZ851sLcUJEIJEr/JygOrY/DGMOg
	XVO1IYz/BjosJ/kMeaxP/bNUnJ0M3hTMmaSmiKFly7cBhdI605DJRSgKSfkFASXTyaiOfC
	cwYcs8jC2rtNYuJBumRvrP30TLLBATc=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com, david@redhat.com, 
	pbonzini@redhat.com, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	will@kernel.org, julien.thierry.kdev@gmail.com, maz@kernel.org, 
	oliver.upton@linux.dev, suzuki.poulose@arm.com, yuzenghui@huawei.com, joey.gouly@arm.com, 
	andre.przywara@arm.com
Subject: Re: [kvm-unit-tests PATCH v3 09/16] scripts: Add support for kvmtool
Message-ID: <20250507-17ee3d8f1b384ab89848e63c@orel>
References: <20250507151256.167769-1-alexandru.elisei@arm.com>
 <20250507151256.167769-10-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250507151256.167769-10-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_093909_759459_65E6AB32 
X-CRM114-Status: GOOD (  11.63  )
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

On Wed, May 07, 2025 at 04:12:49PM +0100, Alexandru Elisei wrote:
> Teach the arm runner to use kvmtool when kvm-unit-tests has been configured
> appropriately.
> 
> The test is ran using run_test_status(), and a 0 return code (which means
> success) is converted to 1, because kvmtool does not have a testdev device
> to return the test exit code, so kvm-unit-tests must always parse the
> "EXIT: STATUS" line for the exit code.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  arm/run               | 161 ++++++++++++++++++++++++++----------------
>  powerpc/run           |   4 +-
>  riscv/run             |   4 +-
>  s390x/run             |   2 +-
>  scripts/arch-run.bash | 112 +++++++++++------------------
>  scripts/vmm.bash      |  89 +++++++++++++++++++++++
>  x86/run               |   4 +-
>  7 files changed, 236 insertions(+), 140 deletions(-)
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
