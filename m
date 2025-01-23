Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AEB9C0218B
	for <kvm-riscv@archiver.kernel.org>; Thu, 23 Jan 2025 15:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yHfbMT/9NL9f0nAVX+nVZfjuu/tzKbLIevOJDFX+cSM=; b=jO49zQKSp9/gyn
	exbjRtsuzzWeBttyBp1dlMDlmy9/K3Fb0R75fUqHbI2dXs7COP5qFbSBH2V+jBlyUKTjFwPfKS4Xm
	G2mjWMzwS2rCItDIKLY94H0kDgxhZHAwKmLIKboMvyqpMFy+sayOZcEiF02Me+N0kBUPbJQz94H44
	hZGHtvDaCCXcN+tpFzX/6m/41CWIdX/QoNZ8IMKbADmFELAgD1lzmB8fC2KpGpKba1tEjLjuXEyZe
	H8tLNbahGpGgGjS+brB2ctAjxU2GcLdyNXXizNXAy/0Gkbuyqb2iSkc2IfQ8RF5pG1dcFVlrReeeb
	cTCSfA3fhFFR7/xoGfEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tazGE-0000000Cj1u-1CJ2;
	Thu, 23 Jan 2025 15:36:50 +0000
Received: from out-182.mta0.migadu.com ([2001:41d0:1004:224b::b6])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tazGB-0000000Cj1T-08N5
	for kvm-riscv@lists.infradead.org;
	Thu, 23 Jan 2025 15:36:49 +0000
Date: Thu, 23 Jan 2025 16:36:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737646599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7daHCSAZnVQzRP+983s7ap8EHdLiIYE2KVKyVsz4xmM=;
	b=RajfLYfSBFBSWc6mFyySZKDs5szeMKvPp68QvuBuich9RvwWiU/TPw5u4GCyHN1qDh1J2w
	RuwGLEDTJihJADhrHv1AyFrSodpLrhKTaeVCo6MkAq4qIKInk09/reGjTOPg8prtIaY4NU
	7bwcJ4hGN3mVOcxgkKzuPoaeQN18ibg=
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
Subject: Re: [kvm-unit-tests PATCH v2 13/18] run_tests: Do not probe for
 maximum number of VCPUs when using kvmtool
Message-ID: <20250123-1155fba5858c4ee31e647d8a@orel>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
 <20250120164316.31473-14-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250120164316.31473-14-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_073647_646259_D020F669 
X-CRM114-Status: GOOD (  16.66  )
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

On Mon, Jan 20, 2025 at 04:43:11PM +0000, Alexandru Elisei wrote:
> The --probe-maxsmp parameter updates MAX_SMP with the maximum number of
> VCPUs that the host supports. Qemu will exit with an error when creating a
> virtual machine if the number of VCPUs is exceeded.
> 
> kvmtool behaves differently: it will automatically limit the number of
> VCPUs to the what KVM supports, which is exactly what --probe-maxsmp wants
> to achieve. When doing --probe-maxsmp with kvmtool, print a message
> explaining why it's redundant and don't do anything else.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  run_tests.sh | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/run_tests.sh b/run_tests.sh
> index 61480d0c05ed..acaaadbb879b 100755
> --- a/run_tests.sh
> +++ b/run_tests.sh
> @@ -89,7 +89,15 @@ while [ $# -gt 0 ]; do
>              list_tests="yes"
>              ;;
>          --probe-maxsmp)
> -            probe_maxsmp
> +            case "$TARGET" in
> +            qemu)
> +                probe_maxsmp
> +                ;;
> +            kvmtool)
> +                echo "kvmtool automatically limits the number of VCPUs to maximum supported"
> +                echo "The 'smp' test parameter won't be modified"
> +                ;;
> +            esac
>              ;;
>          --)
>              ;;
> -- 
> 2.47.1
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

but I hope we can do something with the associative array idea to
avoid all the TARGET case statements that are getting scattered
around. Here, we could rename probe_maxsmp to qemu_probe_maxmp and
then add kvmtool_probe_maxsmp which does this output and each
to their respective vmm[$vmm,probe_maxsmp] member.

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
