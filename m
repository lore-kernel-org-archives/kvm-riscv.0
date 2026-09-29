Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87BC8CA5FAE
	for <kvm-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 15:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KaQFEBzzzriuXFy4on9D2KW2N8jF24TC2rafzANLLsA=; b=bdu+J3RkaOy8p9
	QLM8AqhnqiAxNsWvgbLDuzXbuKVe1uY9eRAnZnhOKwWnuxl75EZqp8b1o1nKRSt3DcGOpyIQyVhMc
	I1v/DCsGrwr3EML7vuGLHIxAIYIx/Iyuvf7uPjODbXGFJlSeXi8ousg4Cfs+xiZA1pFY8sXoMtWPA
	2PHhS9nAvjkjUQM7VeyQgQLERS7eHJY1wOWRA74BAFmJppBnSr8konSHQmpKafrZsS1WNZEWtsUiE
	kMTE3FuVHbspZBe0/BOoB3BFO2NJKev/mVchfwJCnI5R+L/5QtdvuXo6TUCntuKlW1EtOfPGcTiQ4
	nOvGFcXemToacjqV9Gdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBaEl-00000003zjK-3Klr;
	Tue, 29 Sep 2026 15:59:23 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBaEk-00000003ziQ-0f51
	for kvm-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 15:59:23 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49ffe281cb1so20297095e9.1
        for <kvm-riscv@lists.infradead.org>; Tue, 29 Sep 2026 08:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790697560; x=1791302360; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3j1GsvDFG4oGBkWvUsNYUZ4jWPGCGdM9fhJMq32ExyQ=;
        b=a9AyBOA0qUBKFP8kaZRahYjiDQ4/UVNoPCZRXEb3X4MjeSbcYDjFt684jY8f83tklr
         Zv/FXBquOQ0VadIf3F0LuDpASywXJmKMfH4E2nCxxsU1kiGmAGlaaccq6bd/GKO/Hsj9
         FUgvlSFpP5NNi8MJ8Uvtsu7IhiSNiRO5UyoBNJXfYa4MJn1RZ2el9UXgw8t2RLHMJLrm
         LqAh7aH8/qErXZFH9/5Z4MWdn1HPRvl1kQyX0zZ64ZHyBzkeiem4LbmpmGgAlqyPfl9n
         G/g+rjsQT1/Bheud2UmMnT9+ie5hckEEOCZMvq00zj21kPquDPkUFOlrTGFYrSDUr88b
         NpEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790697560; x=1791302360;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3j1GsvDFG4oGBkWvUsNYUZ4jWPGCGdM9fhJMq32ExyQ=;
        b=kZw9Hc9v3pGyIRBEaCbVlqn9d3BUcsYi6MeTEF1Q1SlwhZ68coyyKGqy6lyhzW8ARp
         E7qUTxAMqtX21O7kMLwQeC8GNbAgGwcB6c4gqQeQScVOnG/62oVNh6ByytjNB55JajfK
         +2kJGtmVz4OIhuLkneXogn9kwRjAG8BO+c+hTfrGtZZVp0dwWtYIuFW0usMsIHevW3WB
         9DCDb8crgwluHSWpEgTX0jkjanePDEDmTpff70ls9uhPYGWBeTXijJRocLqh5T6dcDyw
         4zyqD4Tyk24mTiBm0n++VomAlGLqQR1SArJy2J3y0uGbi2oTP1cla0GFdwnz+DR2nTRd
         3C7w==
X-Forwarded-Encrypted: i=1; AKwUvBzV/lfGjD5Uh+j+/W16b+Jc+1777DNXSrSrxtJyeRA/3jGqdn+PzzjKeQGZe6Lyc3tkM4eK/vWcHG8=@lists.infradead.org
X-Gm-Message-State: AFuF++l1FZdsLEfWT2mVZhnWWt/3amn+EDc+JSRr8gtOew9XklqCV9rh
	DAYR52qVKJ/zqdMvdT0ksgPdoq+0VXBrCMP4Hl3HQ3yztJDTYpaolA43f4Fv1j1rovU=
X-Gm-Gg: AYBFou1f9Y+jDwSXIyGGneSQIK78gl3KVPYz0raqte1yqid+oz5wHFFtJdCL6uvEasX
	0cYChDFwUPQ3gZqR7zcKz3Lb+eKBF7gkzxpGqVArahMcEPRs1IS2ly+ks41jtPktXqGMcyGku2/
	N2N+r3cmYwzRWmjH+u+0vCg3slt6PI4/LuJrLo/whiuFJvZM9kPwXhhrx98NF3b8RZ4CGC5zJwj
	j3HOc+7YZSDqvH6vVBhXc+3+jZfIMcpBJgqR8OMUiEUpsN+zCMTDAcUEGcQyG4WFwoXUEI5rNse
	qiL9A2pI6a9DfzvGPyfzTBw9MR/wPqhbGZPf/IKxadBnFA4b/PIUEPN5Ve9LTsqIHj5Vy2uR6Ct
	bL+aOYgafYgx8QM1Mlpn4sVl2gyOFpe41nFI83fzV52TjJDRbOwTUEuvUw6gkfm6et7iyZDx8lc
	EVpAPNY1j03fdeWDI1vm95XLprfW5+FD0qC8BjS5+boj0OIazFcwtu1UnAk8PQcr/8hQ==
X-Received: by 2002:a05:600c:46d4:b0:49f:ec98:f030 with SMTP id 5b1f17b1804b1-49ff06f839dmr227620145e9.33.1790697559827;
        Tue, 29 Sep 2026 08:59:19 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([2620:10d:c092:500::5:5c0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a013c6f295sm7062155e9.0.2026.09.29.08.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:59:19 -0700 (PDT)
Date: Tue, 29 Sep 2026 11:59:17 -0400
From: Gregory Price <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, 
	bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
Subject: Re: [PATCH v3 07/40] mm/vma: tidy up map kernel pages enum values
Message-ID: <arvgNTUgcO0nPh-V@gourry-fedora-PF4VCD3F>
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
 <20260917-b4-mmap-prepare-vma-flag-sanify-v3-7-4583d8a23bca@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-7-4583d8a23bca@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_085922_192806_8A415650 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message.
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

On Thu, Sep 17, 2026 at 05:22:16PM +0100, Lorenzo Stoakes (ARM) wrote:
> MMAP_MAP_KERNEL_PAGES is a mouthful, discard the MAP_ as that's implied by
> MMAP.
> 
> Also while we're here delete useless comments for mmap actions whose names
> clearly indicate what they are for.
> 
> Also update the userland VMA tests to reflect this change.
> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
