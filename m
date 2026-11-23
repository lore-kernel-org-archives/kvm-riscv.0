Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E53606A332
	for <kvm-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 12:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U09ewsCF;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k+wmWzfd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KBOUy8K6wgAUykcai5qdDV0MAwIM/LyJSFROpJlQHr4=; b=U09ewsCF3dRH4hu5CZ8tORqXVq
	QpVcKbLyH6Vy+O+9O3XY2cgw3MAzk5gzXJgCtnEjmALKUBy5QT6TiY93ANIr4St5vrYTFUqoCKdET
	13FoYrqc7+gO+MoMyla913oLghALJhaDaefkFbWpYZ/+sU3QMYeYH6HHmQB5p6lSm1oXuo+nOXEWr
	fzA4N/FtnCfCTq0z0BcpWprTRKlmTE/w1fgWOp47P/qv3G0Bg4rI8wxS90AOX7c26etV1BDgNb4fW
	7Osz+sqkEBZrLGa5qY/QCGzc1ygX+OK6NFyQaP5HsnrlPrIYAO7g33CqT/CxQAWnlDtYwu44tG9C6
	ucK/l4xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVTHL-00000003O8a-0X5m;
	Mon, 23 Nov 2026 12:36:15 +0000
Received: from mail-pj2-x04.google.com ([2607:f8b0:4864:39::4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVTHG-00000003O6H-2JKw
	for kvm-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 12:36:14 +0000
Received: by mail-pj2-x04.google.com with SMTP id 98e67ed59e1d1-3b10718b387so1749242a91.1
        for <kvm-riscv@lists.infradead.org>; Mon, 23 Nov 2026 04:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795437370; x=1796042170; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U/uD1Gm/ThsK3UVlqQr4l1VJFGDwFXp2U6warxXaR1w=;
        b=k+wmWzfd6bk/fo+FDHnKQH8zQ+05FFVtGfk+yGUQB3QsESW0ULcWYimqd0O4KafoNX
         F9lQLEA5HnEFua9XOqI5VskuhuPG4o3fI5FRPeNFwMPS4FrIfdRY1Dri8Vtxvqr63Lal
         nExnRx2fWQEQ9ng4/0e/p0EceVOysWr65zZC4CcP1jjOV1fP1X7M2XB+y8MIhlHE3iez
         gHdl7+2E9gQOj6ihZqP/4/449eIMqdr6FtbR4NBthELS5uW2ptoB5rsHCIJu3lxbtJXq
         d6ZYudkm46ouZkZcwwSkin1xTbu1Q5+NyWvHOsQPxgPwUPOrKXvc5fVUTmsyw2H1wg9Z
         8mOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437370; x=1796042170;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U/uD1Gm/ThsK3UVlqQr4l1VJFGDwFXp2U6warxXaR1w=;
        b=iUic/xlUaNkUKAL+dN/uoSD8e49m6cTLw97lwJZii81YjYyqXXgtKbpRF5Wg8KTjz/
         54cmvlnEqb0w1JQHmMGyYnkqIyOGbn2b6qurgiWtLsjNhnvZLOpO/wtyotZArGVvsdTg
         D+f1rEh7C9j9hIwDmG2YbN3ARAtwwnd7FXkaQpGm4exJuwU7RRL9l18CTiPQpu2mXXeu
         sn/5/INLqUI/AJsFbewgFQURi9kjDtIOpCfYtOT4Qaygew7+L0BBMSjksqjaGuVEQjNF
         1NMdmYp30recTIhEqbk1Jm1cX8LceZW912N1X27hcuMXZFZ6UK84iYZLdSRfmZTGCZS2
         Z8lw==
X-Forwarded-Encrypted: i=1; AL+hErHFCkBmo1IHnIXj1pTXSsgxvES5BfoKM45HM5yiQYkAIUMOLLBWy8fJMg/tTsJH/kUQUmPReE4fGwY=@lists.infradead.org
X-Gm-Message-State: APuU4Z/paZ9AfMnSJOQoxBGTIhxntR0a8E7K3X052X9O91H8BZ6OLjKG
	9YaXVrIdztrY6YQT/OOYiy/eVeEUmd2wjaFB48UAMdFVenXQQvevF7Hy
X-Gm-Gg: AZFdTZceSrHh21IZQ6uVJdaDQePYB2/0DeIlJyCu84PrsLeMv6zpphMbrH4mA0MWxzn
	jjM5w0cRsjnhQx897iaNwPQWfsHVXckTV0//hM/5dbveCwoIygjFkZNIdT8AfyMV6iJqWpINkGy
	Rh0FnGxmclaVvpiICH3EHUi+T+cKH8trIZr90J2eaQmOye5/fH0wSMo0qDXi5fMxn7Ld3BsYH48
	ckXxuV2PprcbRA05voNkVLX9w58NfDQAvpiNm9/ESBQGCs5YUusvt9W4RFdT/Qe/H3BMZELmIMT
	EqPIr/OTR0b6g6bssfomfH9ZQKCbQzshvaX7eTTaQ2Y2RHpnet+Irb3B1BeWHab8Hl4Z29JWsFM
	S2BbBi19GYLkcsRbCW6CCJaRi8cYnHeAP8RKsRTPZhap7yp6D0Qd5l2VC11Apw92sIpmP4mJtZP
	Ynyr0Xa3u9hRBjW2W/iJ35R9zaaMYZVZ653w4IubJlLJqV0U72PpKpAqZgwcf2YyJqmOjazc+Lh
	O1MY3NvWXU3+W74Lo6z2Ob3lDkR09PGY2dO7mLUYU73vmGW4a2xU6Af+KQ7a9xUD+nGaawk4JRp
	mQhY66gJqAyFI3H7G10OESALieQvGuKI+RCEEuteLaZLaLc=
X-Received: by 2002:a17:90b:3c07:b0:3ac:3588:b548 with SMTP id 98e67ed59e1d1-3b41c9b2529mr10221008a91.13.1795437369821;
        Mon, 23 Nov 2026 04:36:09 -0800 (PST)
Received: from [192.168.50.100] ([114.252.97.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b8733e6sm6119715a91.3.2026.11.23.04.36.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 04:36:09 -0800 (PST)
Message-ID: <7225496f-222b-46f6-a609-89921d6572d7@gmail.com>
Date: Mon, 23 Nov 2026 20:35:57 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 09/10] iommu/riscv: Add
 riscv_iommu_attach_dev_nested
To: Andrew Jones <andrew.jones@linux.dev>,
 Gong Shuai <gong.shuai@sanechips.com.cn>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, Anup Patel <anup@brainfault.org>,
 Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Tomasz Jeznach <tomasz.jeznach@linux.dev>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>,
 Andrew Jones <andrew.jones@oss.qualcomm.com>,
 Fangyu Yu <fangyu.yu@linux.alibaba.com>, Tan Chi
 <tanchi25@mails.ucas.ac.cn>, Wu Fei <wu.fei9@sanechips.com.cn>,
 Zhao Qingye <zhao.qingye@sanechips.com.cn>
References: <20261119132744.396426-1-gong.shuai@sanechips.com.cn>
 <20261119132744.396426-10-gong.shuai@sanechips.com.cn>
 <awG5Q7pmntSme1A2@orel>
From: Gong Shuai <gsh517025@gmail.com>
In-Reply-To: <awG5Q7pmntSme1A2@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_043610_599863_BFB5ACD3 
X-CRM114-Status: GOOD (  15.96  )
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
X-Spam-Status: No, score=-2.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andrew,

On 11/21/2026 11:48 PM, Andrew Jones wrote:
> On Thu, Nov 19, 2026 at 09:27:43PM +0800, Gong Shuai wrote:
> ...
>> +	if (riscv_iommu_bond_link(s2_parent, dev, nested_domain->viommu->gscid))
>> +		return -ENOMEM;
>> +
>> +	riscv_iommu_iodir_update(iommu, dev, &dc);
>> +	riscv_iommu_bond_unlink(info->domain, dev);
>> +	info->domain = s2_parent;
>> +
> 
> When moving between the S2 parent and a nested domain on it, the parent
> briefly has two bonds for dev. bond_link() puts the new bond after the
> first bond with the same GSCID, which may come before dev's old bond,
> and since it's then dev's first bond, bond_unlink() removes it. dev is
> left bonded with its old GSCID, so its new GSCID misses invalidations
> once no other device's bond has it.

Thanks, you are right.

> 
> Passing the old domain to bond_unlink(), like I do in [1] for a
> different reason, would let it remove the bond matching both dev and
> old's GSCID.
> 
> [1] https://lore.kernel.org/all/20260928143113.49838-12-andrew.jones@oss.qualcomm.com/

I'll use the old domain to resolve the old bond domain and its GSCID,
pass the latter to bond_unlink() as old_gscid, and match both

     bond->dev == dev && bond->gscid == old_gscid

so that the old bond is removed rather than the newly added one.

Best regards,
Shuai

> 
> Thanks,
> drew
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
