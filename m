Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76858606A31E
	for <kvm-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 05:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f69sgTF1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RVOTMx1X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Pwmz0a1oUIUho9wZ3Xp99vm5tb0IjMCFOgpW86pTlNE=; b=f69sgTF1Sa4IgAXsV/nswz7wbz
	0P3HrbvxXwpO9eXLR8R1C0v/evVQtzcncG9pc9pKbPSEVAFrq8/V5cnFoKvvT+HRiL78uefSV8d6d
	mt2eLldElKdEI2IDumLFWpkA+uq+3/xx+E43id+o/e2rNgiWmt8ADYlHjl5DoPo+hLcKcJv7rnjGj
	q1F7C0C4tIdA95Du6hdBrP2fcjPBcMWtIqqgYHUmC7Ez1l3lgzR+uzLTN7/EBJXV9yB+zePkcOgC7
	39Pf5n5FywZKEsnttrpCWp++XOE0cfxdGTKSvSvFxqCuj6+0E4sKxMvZ72C/PO4DBLed2vr3Al/db
	8FgHf26g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVj83-00000005cCT-3GKD;
	Tue, 24 Nov 2026 05:31:43 +0000
Received: from mail-pi2-x0a.google.com ([2607:f8b0:4864:3a::a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVj7z-00000005cBX-2UC5
	for kvm-riscv@lists.infradead.org;
	Tue, 24 Nov 2026 05:31:42 +0000
Received: by mail-pi2-x0a.google.com with SMTP id 41be03b00d2f7-cd697a57d7eso1163386a12.0
        for <kvm-riscv@lists.infradead.org>; Mon, 23 Nov 2026 21:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795498299; x=1796103099; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MHGUggYwA3gp5Hl40fLruxFZvaBCGWgXTV8JidRQovM=;
        b=RVOTMx1XZEkFBSNvLRUcvM837SirKq/X1PhXa8kMbJ05hJ2lJESmX1r+FQmHjaLqw1
         E2JwdC6EcLO+qMAglBPcJLw4lptH0Sszb4J+3S+m7xpwRTJ5EEikxPautRCZzGnshj5t
         qgkUtQy/jhVrpr47gD830QJ8NrrNnoJHs4h67dsJO9682GsVqpkJxIEfKAXsHcNmuwYp
         aDEOSk6TVTxkaTs/3m/t9f//3TntJWC+RgoZ8fvccCM71vJ0xPUhsMwp4aF3k4AAxM/9
         dMogqlNKdsODlke9QlQ4JOZsow2t/vycl/HQ3Qtc8C0YAwwM8AT52CetJJrV92MX0+Vp
         o2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795498299; x=1796103099;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MHGUggYwA3gp5Hl40fLruxFZvaBCGWgXTV8JidRQovM=;
        b=ZuGbdyg8ZxveXivhvcC9sIBggMA3g75ApJadIESXzaMyJf3nxUE47kZR9qygs92IGv
         6TLo99Z7tjRzKSNANDdaelRYBGybeKUa4z9v1lHfhoHaErp3go4S99MNBB7naPqEPtW1
         1FtosroikOqg3GWiwwv00e2RHuPiU9IyyAZJ04nbLuWckAvdPFPqe71VneRoGk+UBDd9
         TCcip+clwfT36DCU5dihQpQzfEwMM/BY6Z9Qh1TaC1zprBy9Uiuq4wbpREWosBzTLoG5
         TAOBelbTim6QDjFemKKfkMGm2vFCxrikF3iKuip38wq6tguIHbmBPKmsdLykM5+t8XL/
         D79g==
X-Forwarded-Encrypted: i=1; AL+hErHAeNeosmf0sCXsKlUeR8vgDA5CMFZRegzK/XcnyjllpRVuz8anM/dkIKQkGjLOY1HaKzryiXJessc=@lists.infradead.org
X-Gm-Message-State: APuU4Z9W0MgyW95WlDORy11k0t4r3GoB0eGgByzKt2O4vH1xyVAO3uIi
	TZFn4t9U3NJzE6vibXS5GZ45ba2Ij8RKsZfxpGpeg6l+Wy4DPR5wkqIy
X-Gm-Gg: AZFdTZcV28x4SgtWd6/YJpP1D/eVqgia69AW/ezg6EpMIBKikGZfBOxLeF6nabMVn1d
	i8di/c5c3Jn1SnEwBWPj0thBjFvMooLfwgl1mFvMDfTBMdod2EcdZkxjGaaJx3PJkM11kDjMRsP
	osOzp9psmo7jXmHrybuNSNVdKNM6yzytT96UGINH46Wv3DHxxbmAzCrXKpoI1C5k0xMfsOAZCVg
	FPeOOn9WHga5Z6P9unvhZGrBS80mu83taIMCAxtM0Ach8k9HAn5Wj7Kgp5EzSAWm+HyP0XjWj5x
	2qHfsOaqAvBlmUoHXbkMhWRAxlOUZZ7NXplMLBj8COsnJXG/QTY+vkoXtHvTG7OD1wxiDLngbS8
	XmzHmCSTeZdD9iCUXkPWW2btw8DXmGu50egtxVTWGTSRrFHU7t6zhRyKU0EvuimRY8e/nfIij57
	uVUhN+KO7CF2R+O3rAzglozvYW589bycqIq1cB0vUXQutXs0ZdsZc+aYQLX6MN1owPJRZsZgTpf
	3aR4jAaZtLCv3kF/w7dPXVVR4It+0vR/9epClhUBrPMF2oxuaebTMGJuj+aHq7vJlG3X6A50dH3
	bJisPdF8gYhKNaDkbdGYKDnGkhgDYUbmhMVdoLRiTD8ItPhq9Pf2
X-Received: by 2002:a05:6a20:7d9b:b0:3e0:dc12:8908 with SMTP id adf61e73a8af0-4014e25b4f1mr12376756637.81.1795498298665;
        Mon, 23 Nov 2026 21:31:38 -0800 (PST)
Received: from [192.168.22.174] ([114.246.237.251])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6c9c7dcbsm6562442a12.0.2026.11.23.21.31.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 21:31:38 -0800 (PST)
Message-ID: <286b4604-fb68-452c-b131-d3847669726f@gmail.com>
Date: Tue, 24 Nov 2026 13:31:29 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 RESEND 2/5] KVM: riscv: Avoid THP adjustment for
 existing 4K G-stage leaves
To: Jinyu Tang <jinyu.tang@linux.dev>, Anup Patel <anup@brainfault.org>,
 Anup Patel <apatel@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Andrew Jones <andrew.jones@oss.qualcomm.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Yong-Xuan Wang <yongxuan.wang@sifive.com>, Nutty Liu
 <nutty.liu@hotmail.com>, Jinyu Tang <tjytimi@163.com>,
 Gong Shuai <gong.shuai@sanechips.com.cn>
References: <20260815102833.864330-1-jinyu.tang@linux.dev>
 <20260815103245.864925-1-jinyu.tang@linux.dev>
From: Gong Shuai <gsh517025@gmail.com>
In-Reply-To: <20260815103245.864925-1-jinyu.tang@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_213139_639345_BA6ED925 
X-CRM114-Status: GOOD (  24.02  )
X-Spam-Score: -1.9 (-)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jinyu,

On 8/15/2026 6:32 PM, Jinyu Tang wrote:
> When dirty logging is disabled after a G-stage PMD mapping has been
> split, the fault path may see a 4K G-stage leaf while the backing host
> page is still THP-backed. The existing kvm_riscv_gstage_map_page()
> comment says that this path should update the small leaf and leave huge
> mapping recovery to a later ioctl path.
> 
> However, transparent_hugepage_adjust() runs before that G-stage lookup
> and rewrites the fault GPA to the PMD base. If the original fault is not
> at the PMD base, the lookup can find and update the wrong 4K leaf.
> 
> Check the original fault GPA in transparent_hugepage_adjust(). If it
> already has a 4K G-stage leaf, skip THP adjustment and keep handling the
> fault at PAGE_SIZE granularity.
> 
> Signed-off-by: Jinyu Tang <jinyu.tang@linux.dev>
> ---
>   arch/riscv/kvm/mmu.c | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index bfd6168ebe30..2fabcd409991 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -500,10 +500,21 @@ static int get_hva_mapping_size(struct kvm *kvm,
>   
>   static unsigned long transparent_hugepage_adjust(struct kvm *kvm,
>   						 struct kvm_memory_slot *memslot,
> +						 struct kvm_gstage *gstage,
>   						 unsigned long hva,
>   						 kvm_pfn_t *hfnp, gpa_t *gpa)
>   {
>   	kvm_pfn_t hfn = *hfnp;
> +	u32 ptep_level;
> +	pte_t *ptep;
> +
> +	/*
> +	 * Keep the existing split G-stage leaf and update the original
> +	 * faulting 4K page in the vCPU fault path.
> +	 */
> +	if (kvm_riscv_gstage_get_leaf(gstage, *gpa, &ptep, &ptep_level) &&
> +	    !ptep_level)
> +		return PAGE_SIZE;
>   
>   	/*
>   	 * Make sure the adjustment is done only for THP pages. Also make
> @@ -730,7 +741,8 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
>   	 * so do not promote them through the THP helper.
>   	 */
>   	if (!logging && !is_hugetlb && vma_pagesize == PAGE_SIZE)
> -		vma_pagesize = transparent_hugepage_adjust(kvm, memslot, hva, &hfn, &gpa);
> +		vma_pagesize = transparent_hugepage_adjust(kvm, memslot, &gstage,
> +							   hva, &hfn, &gpa);
>   
>   	if (writable) {
>   		mark_page_dirty_in_slot(kvm, memslot, gfn);

Thanks for your work.

Tested this patch on v7.4-rc4.

FYI:
https://lore.kernel.org/qemu-devel/95fe4c53-fe13-4e0c-abbc-bbb546850560@gmail.com/

Tested-by: Gong Shuai <gong.shuai@sanechips.com.cn>

Best regards,
Shuai


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
