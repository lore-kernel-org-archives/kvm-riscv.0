Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFDC1C3ABC9
	for <kvm-riscv@archiver.kernel.org>; Wed,  7 May 2025 17:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JMK1GBGS/pMOi3+8kodKMKhoJVgZO99YE08AGROOa0M=; b=bFtP2hhBqxquGt
	TZ2eKXPwLuL3DGwntyr/AzsATSARpqLOYk/721kcCmQj+yF8lBykRAjB/+2PjzWArtpoVxsK3Y4ZZ
	ih4dOqhtrfyqs9hA4dBPWJIvPxUU2YL0XRTZGsL2VnZrDFIOrwN1oKWkcd9PSw8Xyg65ZKsci8msN
	Oe2JTwCKn1Vykgez4c7f91Gb3qj95IxZguakXEDStb2s/YzMJoINn7qFHgs5Ak/Y4CXSAYlQzkjRu
	A7mVb/Az9cppFX84XjnnQfMGFx/YnDKHTSetsVI09jpBYu5rf+Wf8zBVwSv5RrM0kRcR+3qWM0ZLH
	cEEEq3YBKUXSx+PcS4HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiXj-0000000GKAI-48U0;
	Wed, 07 May 2025 17:26:51 +0000
Received: from out-170.mta1.migadu.com ([2001:41d0:203:375::aa])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uChtK-0000000GC8x-2SQH
	for kvm-riscv@lists.infradead.org;
	Wed, 07 May 2025 16:45:07 +0000
Date: Wed, 7 May 2025 18:45:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746636304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l9xZ23DhdLI0tbSuD9vBHZtbbRiWB81u/rHKaK7rVJo=;
	b=ppfvQ4wRMLDsUxyr+O0llP8JyXWNDUSciVcC0yPy+dqT/scr0F4U50Zn7zq8E/n9V0XxXq
	Ztb8arjgyvckv2/XO/3fF703zzQV3e8Kbpi480DoyCpGhLDg7laYTqjvJaN5X2bvEWOc2C
	7cr2CDvyLf5ltGMDtZJLQCjWCthSg54=
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
Subject: Re: [kvm-unit-tests PATCH v3 11/16] scripts: Add KVMTOOL environment
 variable for kvmtool binary path
Message-ID: <20250507-1ad6b4b9396d8da573c960f2@orel>
References: <20250507151256.167769-1-alexandru.elisei@arm.com>
 <20250507151256.167769-12-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250507151256.167769-12-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_094506_761435_36E7A788 
X-CRM114-Status: GOOD (  18.79  )
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

On Wed, May 07, 2025 at 04:12:51PM +0100, Alexandru Elisei wrote:
> kvmtool is often used for prototyping new features, and a developer might
> not want to install it system-wide. Add a KVMTOOL environment variable to
> make it easier for tests to use a binary not in $PATH.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  run_tests.sh          | 1 +
>  scripts/arch-run.bash | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/run_tests.sh b/run_tests.sh
> index dd9d27377905..150a06a91064 100755
> --- a/run_tests.sh
> +++ b/run_tests.sh
> @@ -36,6 +36,7 @@ The following environment variables are used:
>      TIMEOUT         Timeout duration for the timeout(1) command
>      CHECK           Overwrites the 'check' unit test parameter (see
>                      docs/unittests.txt)
> +    KVMTOOL         Path to kvmtool binary for ARCH-run
>  EOF
>  }
>  
> diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
> index 8cf67e4f3b51..d4fc7116abbe 100644
> --- a/scripts/arch-run.bash
> +++ b/scripts/arch-run.bash
> @@ -372,7 +372,7 @@ search_kvmtool_binary ()
>  {
>  	local kvmtoolcmd kvmtool
>  
> -	for kvmtoolcmd in lkvm vm lkvm-static; do
> +	for kvmtoolcmd in ${KVMTOOL:-lkvm vm lkvm-static}; do
>  		if "$kvmtoolcmd" --help 2>/dev/null| grep -q 'The most commonly used'; then
>  			kvmtool="$kvmtoolcmd"
>  			break
> @@ -381,6 +381,7 @@ search_kvmtool_binary ()
>  
>  	if [ -z "$kvmtool" ]; then
>  		echo "A kvmtool binary was not found." >&2
> +		echo "You can set a custom location by using the KVMTOOL=<path> environment variable." >&2
>  		return 2
>  	fi
>  
> -- 
> 2.49.0
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
