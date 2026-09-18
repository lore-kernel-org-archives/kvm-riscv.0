Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A2AFC982DA
	for <kvm-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 16:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sTI7nodJ6V3NB1qjYIOST85R/6AxhiHWYjhCR4kgLak=; b=xrBoCKidn7yCGv
	IJMGe+1BM0BMwNSP4/NobcX700w9d99K5gGXtkxTdn+XJqx0FiLDGEVFhE6ELF+wM644TfQyb8M1H
	saJ6WEPwe/Oq0w9NAa+edtOpFvJw2nCMU4ONMnMVr2zPDLS8SdWIb2rJbtOE9kd/1md7aa3JhEMLY
	pxRntHSnGXAVFI6gJ+jooqjyJMp4Keefo3xovfBq2M7eZd2ypkYYyEh5HZn6HE6ar663O2Utpx6w1
	Z+eSi8TwQ+IW14AvnjolK1bz9LdVsFmOpY1nUtqjOrBR//CDAa+a/JfD3PkJkrwTYjw4LxxSuCiNt
	/s16F+DX3rIfuYCUWOcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bIW-0000000F0gM-068w;
	Fri, 18 Sep 2026 16:18:48 +0000
Received: from mail-pj2-x01.google.com ([2607:f8b0:4864:39::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bIT-0000000F0fE-11x5
	for kvm-riscv@lists.infradead.org;
	Fri, 18 Sep 2026 16:18:46 +0000
Received: by mail-pj2-x01.google.com with SMTP id 98e67ed59e1d1-39e249c766bso372164a91.0
        for <kvm-riscv@lists.infradead.org>; Fri, 18 Sep 2026 09:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789748324; x=1790353124; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=joaMZtZ2JkCfx/7wOkt6uB/JF0GtO4C1SVtTGC6XgyQ=;
        b=b1+65EWJY2aj8BBWZiOJgNqFdKpIrNSbCQpTI0Wu0wnIg866Mham03tLBMKlT42kTA
         mIZqjymHnfPAsBgs63uVaOA9R8gDDimZObT2S1qawU4jddE6uh1ajr3hCfp3XT/JpbYz
         q9W8ulGkrE/c6MlrTT6iPZeHpG3Aol0q2LMQe6KlsRuGlkrj15OeeGeChITEsXC2aLv8
         zEjM05nrTpcUNiqOLHwT68pL9u8g4r3APcJlo99HsM21Nvg+Aw0veyk/vEaWwTB8vPPM
         uyP5bJQPuDHwopoCcHCSlWSbatqzRIUjSc3edY+x2hQz9o0BApCgp0VyU5ykPbw+I43y
         syLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789748324; x=1790353124;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=joaMZtZ2JkCfx/7wOkt6uB/JF0GtO4C1SVtTGC6XgyQ=;
        b=yyLwot1J77Cwt7NK3LM3tIw2BsuvtaqEWSYSdg5h6TBWX4IZsRWbUB8VNtKzzhKIRn
         YqByFgDs1SVkdXwIEfdyhmJYlj99XQx48gf7kUa1tZ8udbrQ10sBG7yIZlXE8Wai6J5E
         4cYsOqm4sGtFVyR6ew3LoWk9bSuyv0IYZ3Pcmz40whVWAg58S5Sn/SxTE4dL+ZBQVNFF
         U5r/hWNdtHUEmbqLTZ4RGObWpI3CCxEiXQkyDMsze3p7LKG2hVJFB3tVHh2pgdH4PVfU
         QMYOvdbuEAkTIZ6GQCv814SFkRDrn2wXXlY/dcu25VqU0ZZjTEXlhy02RctUQYkNT8EC
         9AyQ==
X-Forwarded-Encrypted: i=1; AKwUvByuQO2AvrZAjEInWkJr/qjRsCj3PvCAhmkK4852wh/CTr7aCuO10eRrexCQg2FMUatPoJVOnlEN3RQ=@lists.infradead.org
X-Gm-Message-State: AFuF++nuPe3+vm3SMCuX0A3uBqRtBrCIk9RqXqxedi8pSZaStlnfDj39
	xJHotPhbm5HADe3kq04oFhCG5vpisKkLKwmVeCTlKCewlXSGJfCbAUNV
X-Gm-Gg: AYBFou1qBKj/FeEkrsd26xIFG6P7yyDjkNVfm63C8ENllxY/k0PwD5MRJob6voEkc58
	TVC1+HupDHwoOkE0NrrFaPlvFyLNf+R/upn12NQywGwc/Q+tdVyvM5/OLnHpxv5l9RSoomi3Fkj
	7X401/m643NIqnz45BG5g8ewhxzZTW/1JtxbTSmJ2QXMBfN3xH2Bmm7OJrjymARCJI5t+DXWKTH
	++cpvtc+r3l78HCblgSA8cx1S1Ko8PlKVRI1383ODlKpOjhNdgRClHEkeI+VviKKwjB/6MXNf1F
	nlurBN4Jx/NOTHheZmBNpmXTf7rPxU8hLjCsR+5ypfY6keclp4wLuzm52vrfZ3sL924GdoAHaO2
	t1xrH/aePYPK2nHOdoEi+ikjyjNjWytSCCd2r06ZaDuUxreVPhGzPQqNq1PZk7+BppP3ZqGeAFl
	8993aVYj6vWOzRdicpltv6yjrPeIUi+hbNv2GT7N49WPZI+sEONx4EQJrji6gTypUsfCu5t0S3P
	+HLYdiWGzllVrPPDw==
X-Received: by 2002:a17:90b:554b:b0:39e:6c6a:2097 with SMTP id 98e67ed59e1d1-39e6c6a2359mr184187a91.56.1789748323892;
        Fri, 18 Sep 2026 09:18:43 -0700 (PDT)
Received: from [192.168.50.100] ([111.199.57.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e55895112sm1814952a91.3.2026.09.18.09.18.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 09:18:43 -0700 (PDT)
Message-ID: <90826872-1374-49e4-832d-555abf8e8369@gmail.com>
Date: Sat, 19 Sep 2026 00:18:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 08/10] iommu/riscv: Pre-enable GADE for
 second-stage domains
To: fangyu.yu@linux.alibaba.com
Cc: guoren@kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
 tomasz.jeznach@linux.dev, joro@8bytes.org, will@kernel.org,
 robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, baolu.lu@linux.intel.com,
 jroedel@suse.de, zong.li@sifive.com, andrew.jones@oss.qualcomm.com,
 anup@brainfault.org, jgg@nvidia.com, jgg@ziepe.ca, kevin.tian@intel.com,
 atish.patra@linux.dev, skhawaja@google.com, vasant.hegde@amd.com,
 joerg.roedel@amd.com, gong.shuai@sanechips.com.cn
References: <20260915032828.11250-1-fangyu.yu@linux.alibaba.com>
 <20260915032828.11250-9-fangyu.yu@linux.alibaba.com>
From: Gong Shuai <gsh517025@gmail.com>
In-Reply-To: <20260915032828.11250-9-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_091845_297698_3C764353 
X-CRM114-Status: GOOD (  17.87  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Hi Fangyu,

On 9/15/2026 11:28 AM, fangyu.yu@linux.alibaba.com wrote:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> 
> Pre-enable RISCV_IOMMU_DC_TC_GADE in the device context when
> attaching a second-stage domain, if the IOMMU supports AMO_HWAD.
> 
> Software pre-populates second-stage page tables with D set, so
> enabling GADE by default does not change normal behavior. When
> dirty tracking is enabled, iommufd clears the pre-set D bits and
> GADE becomes necessary for hardware to update the dirty bit on
> write access.
> 
> This avoids toggling GADE dynamically and keeps device context
> setup consistent with second-stage domain attachment.
> 
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> ---
>   drivers/iommu/riscv/iommu.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> index 16779877351b..f01fd4e2f840 100644
> --- a/drivers/iommu/riscv/iommu.c
> +++ b/drivers/iommu/riscv/iommu.c
> @@ -1330,6 +1330,8 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
>   			FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_MODE, pt_info.iohgatp_mode) |
>   			FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_GSCID, domain->gscid) |
>   			FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_PPN, pt_info.ppn);
> +		if (iommu->caps & RISCV_IOMMU_CAPABILITIES_AMO_HWAD)
> +			dc.tc |= RISCV_IOMMU_DC_TC_GADE;

I might be missing something, but I don't see how the GADE bit set
here reaches the hardware IOMMU DC. In riscv_iommu_iodir_update()
(in patch 04/10), it looks like only the V bit is taken:

	tc = READ_ONCE(dc->tc);
	tc |= new_dc->ta & RISCV_IOMMU_DC_TC_V;
	...
	WRITE_ONCE(dc->tc, tc);

I saw that you mentioned you tested it on QEMU. As far as I know,
mainline QEMU has not yet declared the AMO_HWAD capability. Could
you clarify whether you used a modified QEMU for this test?

Thanks,
Shuai

>   	} else {
>   		if (!riscv_iommu_fsc_supported(iommu, pt_info.fsc_iosatp_mode))
>   			return -ENODEV;


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
