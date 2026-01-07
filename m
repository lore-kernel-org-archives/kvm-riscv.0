Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B4E7D0D145
	for <kvm-riscv@archiver.kernel.org>; Wed,  7 Jan 2026 17:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tg5KMkBRNtCJgvOh6Hr3RSi41SWF0cZAjLZ7ahBJhpQ=; b=w2hzt2oq9QLoab
	xFe1d425fmHxrnoDLfKVtjzrqzb9O6ndR3sTYyj5TCqG8DArFgXLKTZlMTM5m240Br+rcHXkyGZV+
	hCrKALTFc1inYNqobiHXob5PmhB+/Epnjke6H9exPv42hU57fLOPHKOgWf08okFzSHML9NSfTsC7e
	Mg7UIpe2kp1rXVH+KzkQ9QI4oxeSTm/1zxX7ZWAizZqj33knXTOPyT5RRyipQxrZ9VObj628U4JNw
	st+YM980jcSj4+LI7zWozlwn+R7yJ4boLe1uQ/0ZaL9bgMEB2Mqcp2/uvEw88+1QXrDcdP+MOCNS2
	mvgaNzsnQTnSCMszYC0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdXhB-0000000FOpQ-433w;
	Wed, 07 Jan 2026 17:51:46 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdXh9-0000000FOo6-1tNE
	for kvm-riscv@lists.infradead.org;
	Wed, 07 Jan 2026 17:51:45 +0000
Received: by mail-ot1-x341.google.com with SMTP id 46e09a7af769-7c71cca8fc2so1399870a34.1
        for <kvm-riscv@lists.infradead.org>; Wed, 07 Jan 2026 09:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1767808302; x=1768413102; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/E5kiVoPjL6HPjfNbHsUE0ncuM+O4VtxgKzooyiAI6s=;
        b=GkUcv7sEkID36UWSh/zF3R81P0A2dhn5dL4cWT02GFIsVKZfz9JHp2iLvbQEh6h/PQ
         ALvwVr/Gx+zJY0akzU+AGm+ggz0N4pphF/ma0atooVAxbrTWwgsh+dPqOGr+Sawi6WKQ
         ncT5mb6J1a2+VjXBeKrZylGZCl3ERrbnG/Y2tSJ5uhOX0pWb7oFJLdcAyXefdnJq4XQl
         62Y4iPqmm24joCjYZTP1yrSiAdwMtuBkgDN4/Cqs3Uxhy6qQbi825aYcBorR0YT477NC
         K76QpZKui4+ayKMm/+m8Seat9R44D8omFLP4b4P7u5oNg+BUYtB/tEX5fxsb8cYOCOJM
         NB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767808302; x=1768413102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/E5kiVoPjL6HPjfNbHsUE0ncuM+O4VtxgKzooyiAI6s=;
        b=ovaphv7AHLiS5rhdu7HxfC4Jqmd8KDEWkQ4AmUMsgJ/QaRJfhNmaWoSqhDkJ11fa18
         Mr4UeJ6gVkHQW+yD2KUcKwAsgh+C0TEK7XFFpbinzLvrb7n+YxZ/eTi6sUgEuObjRFnN
         MOsWoYqlOx5ImgCl3m6/NH1VGrV0ueTqW31ZJ9WZB1a2Hys1Omyrlvx85BUzFNBdks3S
         MzaZBtzJS0drZ/yys1zmkpEaBKydPUfzuIpODZRUh/CmvGe4CraPigtJN9R6kwiwPD8Y
         3dH7y1rLzTXRlqhp3mQ/jn0D+d6T2D4cevdxHRXj1xIdqDtvTE4GMyPVpMQ5yMuEAZwo
         h/IA==
X-Forwarded-Encrypted: i=1; AJvYcCXhDfVNj7oETCAo5UGUTz2eeG0peX7YHOh8eCWOCqboICdTMFNi4hzkXI93w7U81SLE4TPlYPK4NTA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxG9JdhvJVecFuzbETTNFtCllhHlnSrxUuX/JAGCvsnFxwzI6gp
	ZNQPRIrRkP4Bv/nEjpJy0mrPNo34vURaQdrG/Gr8WyTGgjSd49vTUXkk2Jq+AbDKh4s=
X-Gm-Gg: AY/fxX4XhnohCWyWs8TiRgbQUu02Eh83IyngXOXdPwQ8dFaWY2WkWn5Dqsqvmm9E/+2
	e4E0Jp+eJTTUFMOL0oH8Z/zLdg1Oz2EJpdN7Cr3M2+IGlkY0SN0ryxADhx7EDXt/big3VhsT7aG
	5BNxxgMsjFghWBppoleOnoD57sjqirGyQNIkN5BrgPI2B8En+5xOf9jPF2ZFhlZvJWoIf7Ceyk8
	Y98LeAXXIVf14NS5DbLOXiPkwmQhH0cZa2oAdMUo/r0GTfudps8Qbme9SzoKVWU9niL60OSA7rT
	vMIS02e2yey4hapQxPvFqUypg0IPlM57oYnIRgTKPSgheUcNz5DgjWIQ4UvnuyTwWrsY/0Si0ny
	gVRgN2bH4H0Ec7Q2sFkN95yAtvACeh5MUSP5pHWsdOfskp78uMYt1kq1R+dS5RfqoA7XMqWEeOq
	XjeDhoUHHHhkao
X-Google-Smtp-Source: AGHT+IE13osf5CjYyTbx4kUFVq9/wdcOC/ch/TW3ja8QBG6H6cD6+EWQcns0Lx1kzYLZNwCYibHqkw==
X-Received: by 2002:a05:6820:2204:b0:659:9a49:8fe1 with SMTP id 006d021491bc7-65f54ed4064mr1332868eaf.14.1767808301928;
        Wed, 07 Jan 2026 09:51:41 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ffa4de8cbfsm3524574fac.3.2026.01.07.09.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 09:51:41 -0800 (PST)
Date: Wed, 7 Jan 2026 11:51:40 -0600
From: Andrew Jones <ajones@ventanamicro.com>
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Zong Li <zong.li@sifive.com>, 
	Tomasz Jeznach <tjeznach@rivosinc.com>, joro@8bytes.org, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Anup Patel <anup@brainfault.org>, atish.patra@linux.dev, 
	Thomas Gleixner <tglx@linutronix.de>, alex.williamson@redhat.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>, 
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: Question about RISCV IOMMU irqbypass patch series
Message-ID: <20260107-dc4b5f1d879db9afb00a4a87@orel>
References: <CAPYmKFscKJ1ff470d6YmuMxLdJPSZ-ZmuGMMAFO83TT-vvV2JQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPYmKFscKJ1ff470d6YmuMxLdJPSZ-ZmuGMMAFO83TT-vvV2JQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_095143_774869_82D83671 
X-CRM114-Status: GOOD (  18.40  )
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

On Wed, Jan 07, 2026 at 06:01:26PM +0800, Xu Lu wrote:
> Hi Andrew,
> 
> Thanks for your brilliant job on the RISCV IOMMU irqbypass patch
> series[1]. I have rebased it on v6.18 and successfully passed through
> a nvme device to VM. But I still have some questions about it.
> 
> 1. It seems "irqdomain->host_data->domain" can be NULL for blocking or
> identity domain. So it's better to check whether it's NULL in
> riscv_iommu_ir_irq_domain_alloc_irqs or
> riscv_iommu_ir_irq_domain_free_irqs functions. Otherwise page fault
> can happen.

Indeed. Did you hit the NULL dereference in your testing?

> 
> 2. It seems you are using the first stage iommu page table even for
> gpa->spa, what if a VM needs an vIOMMU? Or did I miss something?

Unfortunately the IOMMU spec wasn't clear on the use of the MSI table
when only stage1 is in use and now, after discussions with the spec
author, it appears what I have written won't work. Additionally, Jason
didn't like this new approach to IRQ_DOMAIN_FLAG_ISOLATED_MSI either,
so there's a lot of rework that needs to be done for v3. I had had hopes
to dedicate December to this but got distracted with other things and
vacation. Now I hope to dedicate this month, but I still need to get
started!

Thanks,
drew

> 
> [1] https://lore.kernel.org/all/20250920203851.2205115-20-ajones@ventanamicro.com/
> 
> Best regards,
> Xu Lu

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
