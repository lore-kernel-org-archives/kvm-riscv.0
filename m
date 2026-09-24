Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F67C9830E
	for <kvm-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 17:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HM1uDVxmddFdbWN8ajFHdD+vpshfrWIYxV4oI8F8qbY=; b=GQygMGSu+LeDVV
	8DaXq6eeV+O5aAueSu3NuS+FNnkh2uPVJRwypIPtYNTki81SKa0sRhi0EsN26a+FOuv7LRoQXB/Pf
	7n/0qXQMLsUxkU7ggsYw2QEylN7YfLghiyJR/Fz2LDN3QSMuE1gxzWTOLv7gHEnLjBM2zvLz0WCz/
	uip+RM1AJ+iIYiZj/0RBQgJghc6Z/r//p3DkwrGNmQs+S/5HXQ322Yo3M2xiJ6XM5MlDxb6YqOGhm
	i2vpJ0DzXSzxwUYt7dfS1p0FHgC0WsdJQyJ4nNr7/saSdNmYt+xBSsUdNtJw37rcq1lA1qnBwIZnt
	Ch61HzwimgHOxhiDgdIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9n4g-0000000BhkG-2SfL;
	Thu, 24 Sep 2026 17:17:34 +0000
Received: from mail-qk2-x11.google.com ([2607:f8b0:4864:34::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9n4e-0000000Bhj6-0m8L
	for kvm-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 17:17:33 +0000
Received: by mail-qk2-x11.google.com with SMTP id d75a77b69052e-52fb76bcb1eso559541cf.3
        for <kvm-riscv@lists.infradead.org>; Thu, 24 Sep 2026 10:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790270251; x=1790875051; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=feTLx7y3sxZ57LB+c+M8YbdddVhljMzyHzPRAu6TpA4=;
        b=BmjHDWyrME5CR9CubonolQn2zrlZpmmrPGzRSnah23RWKc47TNtOOoSCKbYXrXjIgx
         lV9SplZYYKe5BCbc2WgYu90B/V6AFF2K9HqVh7Iu70RKk2k46m4r3ryeO7tW97PcOf79
         4BsOQ9QOld7e4jfgOkkiF3JvWsr93APmgX1tasX6gTlvOnPpyBfDv7YiVsVrPO+0Oy04
         K1BpFMclVJpcWHuEZLBzLuxrP2W5yPJYOJ3+wXz6sfwKbuyg+9Bz1g2T+yRQEK5dKmTG
         dH/FglN02tRCAAXNwBcBnf1jCn4STjo0Yd6vXmDN9t743dVFcwrqkX9Fp7wSRLBDK083
         tXDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270251; x=1790875051;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=feTLx7y3sxZ57LB+c+M8YbdddVhljMzyHzPRAu6TpA4=;
        b=tccDkEAd3rGK8IUxhhf/1bqX4uNYeW/Qkzw8k3jlu3rY3Ca52pKsL2XQmalIXlB20q
         QczaFjq+ruKFsJDFBhMlqX1El0iKw5OfkjYN/MU/5s1QFEvDu88+zI7Eign/38A1zY0k
         hwx4mw/KfDO/qhkT1q0E2GaPAYvg7F1BrccWka+mm4XX4QMzkivRYZ0btZt3/FV2O+P6
         BkxsqvkGLEEycpL/y86c99R/yQcy2mkg0wq6nxTo/ATayktWiaTSK0LUV8ArFjYSFTnW
         5utX3FTjaeiVcuWOdiokPM/uyFwV1HP5Wlzdua7bie3VbxPFCYDfOQrcOyJ6HAnCmaxE
         iRDg==
X-Forwarded-Encrypted: i=1; AKwUvBx47gjMf/shVVNYh16yJKoF6WWeYM1l4AcPR7TCCanKulTPM1OoaizHWjA9t1Qc1v3YpzSSIOMGDmQ=@lists.infradead.org
X-Gm-Message-State: AFuF++nALQS5a8PPCZYQo12D9LuDhJbppg8BsoMGlCGaww6kucrKFqc1
	/wZFktm8f36y9S4bYLNzX37lRjkPwgH3nQufcn0/oY152+Imnqe4+X/tWUFZ+3o88nQ=
X-Gm-Gg: AYBFou2z24OSaAaPKpSql4CkDe3+MLxbgcx5RtRYjYe8zZMoS/Z63+ZP/rckmeGJKAY
	FsTjnbK8QTD44uXSKs1l3YIuN1IWyvhixe2dlAussn65dKozKRR4PmKeYSHhV2ydVx/84HzEKJz
	cSw0w4NowhQyw6yAL8gGYkCaxMr6NhS/YiPBqA9kfLO5o1SUcgxT5EvsylOaNnJ4WDKlFacczBf
	6kHtP6J/VKiJv1IBB8KiBlE6I6hXUYirai3PbnCsul/7ysuHfT05ItFpyHemSSi+KWs4t5TAVGD
	FofsGCuf04aMOzNSpUV7Amdtj+BMb2veO3RameHHmHYLDHODiIXPf5sQBWds9+cZZwDJ1WXQayX
	iW3I1boPL/pDq8A0ble5EQ6UExBXWEsjHJ7SLppdTYZCBhE2ut44cmuCYkmIO/QDH9yN/fR0CiP
	Xs94fZVAwUte/x/hI0Uf7kEPdmSJuSfEzva4sjOh2qVOui55yDWnPEXMFImv58p4WW1jBIMdhPa
	NAXp3E/eV8eWtXCkqxvRmEH/Nu2GN6XKJlVcAdnR7Znar9E1ggxwJs=
X-Received: by 2002:a05:622a:2b05:b0:530:42e4:f001 with SMTP id d75a77b69052e-532feb3025amr31555731cf.46.1790270250746;
        Thu, 24 Sep 2026 10:17:30 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532f8b7174asm25743881cf.14.2026.09.24.10.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:17:30 -0700 (PDT)
Date: Thu, 24 Sep 2026 13:17:28 -0400
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
Subject: Re: [PATCH v3 04/40] mm: consistently validate VMA state after
 mmap[_prepare] hooks
Message-ID: <arVW5i8pvySq6Co2@gourry-fedora-PF4VCD3F>
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
 <20260917-b4-mmap-prepare-vma-flag-sanify-v3-4-4583d8a23bca@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-4-4583d8a23bca@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_101732_234384_DDDF238F 
X-CRM114-Status: GOOD (  10.38  )
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

On Thu, Sep 17, 2026 at 05:22:13PM +0100, Lorenzo Stoakes (ARM) wrote:
>  static inline int mmap_file(struct file *file, struct vm_area_struct *vma)
>  {
...
> +	err = mmap_hook_validate(prev_start, prev_end, &prev_flags, vma);
> +	if (unlikely(err)) {
> +		vma->vm_start = prev_start;
> +		vma->vm_end = prev_end;
> +		vma_close(vma);
>  	}
> +
> +	return err;
>  }
>  

I indepdeantly validated the sashiko report on this chunk.  Seems like
close() should be deferred until after __map_new_file_vma() calls
unmap_region().

suggested fix is to drop vma_close() from mmap_file()  and update the
cleanup in __mmap_new_file_vma() 

if (error) {
	UNMAP_STATE(unmap, vmi, vma, vma->vm_start, vma->vm_end,
		    map->prev, map->next);
	vma_iter_set(vmi, vma->vm_end);
	unmap_region(&unmap);

	/* Release driver state only after its mappings are gone. */
	vma_close(vma);

	if (map_same_file(map))
		fput(map->vm_file);
	vma->vm_file = NULL;

	return error;
}

Example race:

  Thread A                              Thread B

  mmap(MAP_FIXED, address A)
    driver remap_pfn_range(A, page P)
                                         load/store at known address A
                                         hardware finds the new present PTE
    validation fails
    ->close() frees page P
                                         UAF
    unmap_region()
    TLB shootdown

With that fix

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

~Gregory


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
