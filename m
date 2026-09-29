Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A70C9832A
	for <kvm-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 15:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KZHxEIGDJdV5zdW+QXLNBUGKANcTaMq6NMjEUwRbPsY=; b=mzoqlm9tmxm15g
	gpNiNR2ulSnLXcnroOENAMSKiltjzTHSH11cTbKYwLCCt12B9Vnrn87Kqnj4lr3zjZr+2F2Yq0BcW
	8NmE/opL/Pns7qohteZdTusrqF6vWt65dQa/5BTeF9HgBD6IMDYRqMKhYbaEMejbNdE47L754UBjN
	SydZqzZjAh4qWtLpSk9JBsElDvMjo4SvkoWq/SGYWHZMdOCMEUX/RDfy2RDVzRtQL+ZNXdhp3DWg8
	IppKP2p7h4oDhPUzJH91cTIRtqUeRFzhAZ65QCDbV0Pv7+hsF0d1s9k4mW8zhBBwvkFkEEfRuEfpT
	ZcUHFIT8r7pPwf905TEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBaDq-00000003zXu-1BFs;
	Tue, 29 Sep 2026 15:58:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBaDo-00000003zXJ-1AoU
	for kvm-riscv@bombadil.infradead.org;
	Tue, 29 Sep 2026 15:58:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Gf4CL38l7K7zHB2Jr75kV3VIF1+DE+Av3C/FhqhlLqk=; b=XgCKIIE8p5VUyE4aOMC71ALpfG
	0ccG2Yn9sj7sugTUUAbK7BxPuuVFIhKEf9uLipOFEPk1tDK5wZSzymVXF8abs0kQCGxekIHiUClHy
	qHxJLdyTRZJQH783+/4YLRQiQkAOeSaOihW1NiftLF6bi9i0m3G/djYLs1CglpBm4/szdQ8ApTg/1
	jY6Hyh/kgThkqvKgZk+SCMGb9XgRwUOxvy1EOHmo6VNr5vKPYrx3Mm1O2ydn2VfvBgzeFaCQo/xHR
	hXk4tT8OxzYVzKREwZgSKNUsTsPCayWG0VPb5qp7DW4OjFyl8xFloxJvS08JuHUWfmN+eVj4xMkKO
	TZRAmehQ==;
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBaDl-00000002p7Y-2Q6s
	for kvm-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 15:58:23 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49b912d3920so32758915e9.1
        for <kvm-riscv@lists.infradead.org>; Tue, 29 Sep 2026 08:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790697499; x=1791302299; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gf4CL38l7K7zHB2Jr75kV3VIF1+DE+Av3C/FhqhlLqk=;
        b=WyeQ18zT+sX1yxCCH++cYyWkzgLUvgfmuzud5LGJphcQwfuhinMHRKtDEct/Z05aL9
         ntOur+cZBO1llGyKNY3Vkp/bUlGci1eOMfvxRDKkab8XcktrgMs+wtXiaxjrP3Fb6Q2q
         KxDGoU0NkFzBzLgXw61SQoFAHm9vvIkjgJl7pTvXxdQ13p7U6Af2K3jIcD0Asaciu797
         ajacg25qt9dAppg3r4X4dAomkLuHljwlml044yzzsgsWn2pVwcvvfgQkcSXfuVofUk+a
         2HJJkvd9T7IU5ZSB64rBvfa/1rJ3GVx+sBYjwaCZsGEappcsNiRq2aFSRt6DnRwoBR8M
         CoWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790697499; x=1791302299;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gf4CL38l7K7zHB2Jr75kV3VIF1+DE+Av3C/FhqhlLqk=;
        b=GvYcBh4cDFNqFq2hpcfJZvXFHuayivVKtmqJCVCy59v8uJrqXw45e66fIn5KscxRD6
         I0cdFdFN45QrE/KukIq0Izddb16nv6gVhdAD8aMfQOcbMc78wYv76kYUk+XIiKmLn6Bo
         QJ19ML85QQD9Dtmq2NnVfOt4hK1SCdufEaSkNCRUiUMRGeJMSNcYzY60zOAGAmlJgFU7
         20C5GSTkYlNwENzdGS0No3B+JBLb3GrVUVWYJAL7C3FRiGiT82FRLfoK5p3sITfvonpl
         eQA1BY0xN2PZ0Ay8ilzQLFq4KZy2a3Eo8Y4wjZv6x88FLDxpgMTV97Y3QEc/FdfHfAwy
         /hUA==
X-Forwarded-Encrypted: i=1; AKwUvBzZKK1P6DiZYpBN3YbbRDhNXeiKI4qzQNTdC2OuQ05aqIE/bdZrcxpBLPOd3NWV1R2awoBMLWfL6+o=@lists.infradead.org
X-Gm-Message-State: AFuF++lZevWfMqmNYG1MTnChhZ9rRf4bk7DHZVdRckoApuMrnSDzXDpB
	28vdxZCXHIpuzguk0vF7mOXuePoyPCgVvPUo3qmj4cI2EBsLG9fDQezfF4e2TCwlZqw=
X-Gm-Gg: AYBFou2czTfXMeOO5qM2/3ul6gWUq6/rgQti0hzELNb33wVsjJGsG3mPbiYHtYkFkpE
	3hmPtvOGKbxCRAr1zK/XR2MQvv75qMD4VnHHHb0cJsAlFElqRFMdmqVo6hArTk3MsDOw6NMaELi
	t1s9WUKYMjHK8su7uZOaYqUxK3ZtecNiLXbEo3EokVbVE9WrPUaOYWU/qhkXij+Hahk/JcwnSWg
	Mz+z/goPbnjA2dxsGhnfr3t4Qgmjykna9aiwf61UcJRK4ugsDwucBr8KYIqTwmAX92sk/V1mL97
	+Zhdg+Ed4A1Clv/ppmScIH+L67fExSMalhQ0p3BZwLoaBDva6h/V/VeyByOkoAsRT2dxQvDwB6t
	fcBqgTRmt9zdLFVuWgW0LNtqkervYypOJioHfyQBe4xSgF8egKNRnRm3JUloCP5pBdDX/t3vudo
	2T/Rzdu+icc4XtvkL7V69CLobRf+c0nRvFs8c/K6qgY2ueSviG2zPSEZK+ap8E7DkFwV7OKLIjw
	8CP
X-Received: by 2002:a05:600c:1d1c:b0:49c:eb16:9fd with SMTP id 5b1f17b1804b1-49fe66c9ae3mr284330975e9.3.1790697499193;
        Tue, 29 Sep 2026 08:58:19 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([2620:10d:c092:500::5:5c0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf9dfdbsm127631095e9.1.2026.09.29.08.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:58:18 -0700 (PDT)
Date: Tue, 29 Sep 2026 11:58:16 -0400
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
Subject: Re: [PATCH v3 06/40] mm: make map_kernel_pages_[prepare,complete]
 internal and unexported
Message-ID: <arvf-dEnIzsXhzkL@gourry-fedora-PF4VCD3F>
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
 <20260917-b4-mmap-prepare-vma-flag-sanify-v3-6-4583d8a23bca@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-6-4583d8a23bca@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_165821_621164_43138149 
X-CRM114-Status: GOOD (  12.13  )
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

On Thu, Sep 17, 2026 at 05:22:15PM +0100, Lorenzo Stoakes (ARM) wrote:
> There's no reason to export the symbols for these functions which are only
> called from internal mm logic, additionally there's no reason for them to
> be declared in mm.h.
> 
> This patch therefore removes the exports and moves the declarations to
> mm/internal.h.
> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
