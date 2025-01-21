Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 642B0C02182
	for <kvm-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 16:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xpgar3YsMtpxh/R8UCvKxD7KMLlVjT3OEhVD398BFFw=; b=dywtkH2/JIvf+S
	x040SWg/MhcFA+GtJtXEaJa9Qtd1qBomEwHhH7+lTXNUhB9axkSUMhCJVK9UDhYjCt5Y7QjoFzmKV
	cTBX818+25M2OBRmrOJksTx3CmJlpNYOrRc+LfmAj9E4DtdrvXw/2WkkCK36fhbjpYnp5237v9WQI
	99ktOT9z9I3Ia+3COdMzOWQLdY0U+4RWluACh0WY25kD5F1Zu+LCndTB9djyFi6DjqLfWViDCkab1
	PrJ8L+xS0++cZ8cr21CjnLrecoS3P5NkfPI/HcBvsu3vz38tTQe3S71H5crS9bK4GtoHsId4ffXJ7
	YYX6XbwNGCxJGG7od36A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taH96-00000008MRa-0AiY;
	Tue, 21 Jan 2025 16:30:32 +0000
Received: from out-174.mta0.migadu.com ([2001:41d0:1004:224b::ae])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taH93-00000008MR9-08m1
	for kvm-riscv@lists.infradead.org;
	Tue, 21 Jan 2025 16:30:30 +0000
Date: Tue, 21 Jan 2025 17:30:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737477021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cCgssfmF7bQh08XnJwCfEdidZwB380Ri5cMen/pv4ro=;
	b=xY8F3an6zCEpk15gGynkafua9yyx97TTaOBTqWZmP6mBMpuavhwbnszC6x+BQY+pVarPUn
	9IvUfPiMo6ic2OurHPSlmvcdOVCeiJWpDOw+NbVIPLWLHem49eE1yCj7W3pRiH/N6rOqw+
	2K3BWGs0CUwO6E6xqSiFWrYvpeaqZh0=
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
Subject: Re: [kvm-unit-tests PATCH v2 09/18] scripts/runtime: Skip test when
 kvmtool and $accel is not KVM
Message-ID: <20250121-52d0e326cb9a3091229a7a77@orel>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
 <20250120164316.31473-10-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250120164316.31473-10-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_083029_214069_D3CD16B4 
X-CRM114-Status: GOOD (  15.03  )
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

On Mon, Jan 20, 2025 at 04:43:07PM +0000, Alexandru Elisei wrote:
> kvmtool, unlike qemu, cannot emulate a different architecture than the
> host's, and as a result the only $accel parameter it can support is 'kvm'.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  scripts/runtime.bash | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/scripts/runtime.bash b/scripts/runtime.bash
> index ee8a188b22ce..55d58eef9c7c 100644
> --- a/scripts/runtime.bash
> +++ b/scripts/runtime.bash
> @@ -153,6 +153,11 @@ function run()
>          accel="$ACCEL"
>      fi
>  
> +    if [[ "$TARGET" = kvmtool ]] && [[ -n "$accel" ]] && [[ "$accel" != "kvm" ]]; then
> +        print_result "SKIP" $testname "" "kvmtool does not support $accel"
> +        return 2
> +    fi
> +
>      # check a file for a particular value before running a test
>      # the check line can contain multiple files to check separated by a space
>      # but each check parameter needs to be of the form <path>=<value>
> -- 
> 2.47.1

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
