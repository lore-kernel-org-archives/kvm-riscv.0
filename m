Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7000C98321
	for <kvm-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 16:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pq21bScYmPnsu8vxK2B3iQ9LdMtlKBlZK9VD7Hrp03E=; b=3egv3YFjKvr4PX
	5ni4vRCTNRFBiBDOPUzSvO8aoKKHRrkhobgCRgInSKj/xwkQF5rrNtCA+EiZ6gVdHkO6pDujKqnpk
	1m+K1MdL2ihJ9rCbZaFAe2F2/ZSwnVLZKcKdPWv79JL75Dky++qNrhFnRwvkVLIe0Zt/DJtulse2N
	UBaEkhQ5wkFCytVvffufg4tzMkYSlFM5ufhacQEEHGso5JtJAmwKaT+O5d4ZCfazVWlkCNRVretTV
	j25dXARqxb9B7d97CAfsuoTbmeF9K48WUDBRBbsUxjJcj5Ob/3e2RwJJwTKovn+twm4tuSvEg3OkO
	HbBj3KrAIZTy0Kn7zRWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9mSe-0000000Bcdp-0hSg;
	Thu, 24 Sep 2026 16:38:16 +0000
Received: from mail-qk2-x11.google.com ([2607:f8b0:4864:34::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9mSa-0000000Bcc5-2meH
	for kvm-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 16:38:14 +0000
Received: by mail-qk2-x11.google.com with SMTP id d75a77b69052e-52fb76543e2so141191cf.1
        for <kvm-riscv@lists.infradead.org>; Thu, 24 Sep 2026 09:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790267891; x=1790872691; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LuPrvXBzY5FQ+f/5fzbveR9yF272P1V2+jsIcGJNdC0=;
        b=XfMocC2DgEmjyjTRdqpIn3n6OX5bnCO34fAWZoMacwOQJevxK0YkPX0YYJe6qqogX6
         fb6Rdw03TglLfViT5aHzariRazGroyHnIJiWX3HGOCezw4QbI2l+9QLv8aqcVo9rXDzd
         cY1TbiZCqYkqwUp6s7bwUYfMDtPtfnWFnaofg3YB0peUso8u8GYJSwR9UGZoMNUtSEgy
         FFT31SJF349+p7x6psHziEYO+H41ESiEomQGatL3FreGiNdlyb3MD7UTTOJu5PBV6IRp
         STWtP6P2rPi8Rmd91uVc6/AYFTPDWoDudveHT6xedXyB8c83CssFIUFqFUxHMM/NgRjs
         /KAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790267891; x=1790872691;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LuPrvXBzY5FQ+f/5fzbveR9yF272P1V2+jsIcGJNdC0=;
        b=p8QMgK0GS4EaA8bgbsPGZoeobrNJdLCwwpbYE+z3lQVf9WGvBPy0zMaAyBjpLCS2lF
         uTqtP97FXOBvTFLbblfOYsHaOEqiyLjZvfHCC5I2r9jGrGrvDYxug64Kvt5vtH/QGX6p
         DdUfDkG+m2/GszbimVWMTKE1F9GhF+rlqmJS9pltROJrq1+1F+WcPyFviyd0DflZLZpj
         5ChVRySfUe7n7fWOSzT/1LTHxB7vGe+1w0v4//8gU+PweKX1d8RULh3b/4wrLzAnQUAJ
         PnI+E1DNDwBZ/1FZH1ixiYwaUgqLo3yIEf1GP8EGVjIUcb53Y/+Pl5FNGOZs5fmRI3bb
         bl/A==
X-Forwarded-Encrypted: i=1; AKwUvBx5BtYnVp5azBt2cj3Ad/LjZCZGpIIuaMxnVd//jNAtNezBRYj5EJpDB7FvV1SQiOkKOpZSxB2Fl9Q=@lists.infradead.org
X-Gm-Message-State: AFuF++lRIMF7JIBqHEwV7JdZiEX4oQPYxz62Dm58wgO6H5mGbxNeLMm0
	tZPBXP9F9/GqW7JlgI9eVrImuA77wnHm5pQ7gq076tUXiG70NMTGQ65ks/CTEEJguXc=
X-Gm-Gg: AYBFou2VTMcGrfBE1Eb6FneX+rK14mlvjtTBb+jlwX0EV0v6tzEEURgi880gLWqz1lD
	ZP7gsnHNO2rCtThRbYaWJhU6dRKLJ8CRW1+qwTxDMPznf9LkHKdnjZrUzfBT1eXgytfdQueUFB+
	dWCU2pbz1rCrMlFAvAL8Mj+uNM+oTxwv7CfgM1g8k7ulcOXgEN9X9AnFXY5x0AxayndqyfF0+/B
	G/nYMdVCrN9DjQXGAnpPOT50HDPXu7EBivK4ubnQXyTer5zAz1NK4jaWqOrgMzxVK4YWuOo2AxM
	5ay2vpr9B+Tqq7ZqOtYXLlScpHVwEXqWQpOAUolDWDtA8nfraPw5OAhEkHjxvSAxPExxdYCqy+M
	cBxxSTjR/TVT3feGc85TevwpivNX5xVilXFI+af6FIqZd3ofF62jISg6C/EdsHYU4nsI8KOe0eu
	zyiVcyriaPENzQgd1FV8Ho7TrRswbMngc0/NB7r21bOLc5u9Ourzrge/GNzD27WYiPmq7pv8Umc
	aM4V0+BPmkVEW/8glOHF73Toea65EssIRcbLz2ITrP8w+VziPMOZdg=
X-Received: by 2002:ac8:5743:0:b0:530:d860:ffba with SMTP id d75a77b69052e-532fe9f05bamr29797891cf.6.1790267890993;
        Thu, 24 Sep 2026 09:38:10 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532eb32f6aasm45064551cf.16.2026.09.24.09.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:38:10 -0700 (PDT)
Date: Thu, 24 Sep 2026 12:38:08 -0400
From: Gregory Price <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, 
	bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
Subject: Re: [PATCH v3 03/40] mm/vma: introduce and use
 vma_[flags_]can_merge()
Message-ID: <arVRqJZkql6sGunt@gourry-fedora-PF4VCD3F>
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
 <20260917-b4-mmap-prepare-vma-flag-sanify-v3-3-4583d8a23bca@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-3-4583d8a23bca@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_093812_713043_8AFDE008 
X-CRM114-Status: GOOD (  10.49  )
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

On Thu, Sep 17, 2026 at 05:22:12PM +0100, Lorenzo Stoakes (ARM) wrote:
> Replace the open-coded VMA_SPECIAL_FLAGS check in the VMA merge logic with
> two new functions vma_flags_can_merge() and vma_can_merge() and update the
> merge logic to use the former.
> 
> This abstracts the check and expresses it in terms of the desired behaviour
> rather than an arbitrary and confusing VMA flag.
> 
> This also lays the groundwork for making further improvements in VMA flag
> usage.
> 
> Also update the userland VMA tests to reflect the change.
> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
