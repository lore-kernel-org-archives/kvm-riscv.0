Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7748DC531D0
	for <kvm-riscv@archiver.kernel.org>; Mon, 27 Jul 2026 12:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ccyPwUrAlE3ATclprEayS6BUvL44qpuRg/srVvKtK6o=; b=cBCPcHuf/BngZg
	is7c/nj07Vi3zWLbbxabyV7yqWylTpqR4XDunfCLaxpRiLbIU1FEXbl91PtWEGN7oxV5ZNpBvKJ2C
	HzUqPmrO4jIqgxx/dr+A7dNn7+vGkZUJOpR5fwR73YULs3a6uYm7BZmUN3xaIzVXdfORKMw/ukqsk
	aqol73Y+ZtH7UyiGKuxKjSqXfuJVPYlnmYgmG6f8ZvmC4qPrsKRsqjJDrPfMUDjBe4We8Eq+/Pop8
	0di+P4t6nAXdc5qCvhbPMgOgksy51kZddTKAm9/X17uhoYuxbsdYqKgCsUdKmXeXDadiogTerDS3Y
	olM5YM+WHLFkO5Y60hSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKcA-00000002j9a-00I1;
	Mon, 27 Jul 2026 12:39:26 +0000
Received: from mail-pz2-x01.google.com ([2607:f8b0:4864:3b::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKc6-00000002j8i-1sPq
	for kvm-riscv@lists.infradead.org;
	Mon, 27 Jul 2026 12:39:24 +0000
Received: by mail-pz2-x01.google.com with SMTP id 41be03b00d2f7-c9fcd903839so1211308a12.1
        for <kvm-riscv@lists.infradead.org>; Mon, 27 Jul 2026 05:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785155962; x=1785760762; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rHRV5gwUjVGQwdFF5biWwFHxQewlnY4tVqU7C1q5tGI=;
        b=emzXZXaYfrDPtUEU3xPVoviKsWeQh5R7cTukMQkh7oksfvEQUZ2vzrZ2iWiMyJWIbh
         yFU1OFu9CoctLmC+lH8KW41OVV3ZkwJA54hDygjk9+SRIuluMk6/L/OOLASL0vn/+Iq3
         piNr+ompWRL1VMVlu4/mt25DgfUMiD4l9Q5nr8+jAR65YFi8nxW03poQ4NNPCfLTmNZW
         JVsycl276VWolAnDOqeRLtsY154seeAhlge0trmqnZEzl/TeJo9+9ZRrjjrlscoxVpKg
         SetX4hZ9h/LPPfc74jUPTRK2ZSGuRb3dKYWGhopB0rD78+6Zj1+YTAKtRaaeUZSrshf7
         v4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785155962; x=1785760762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rHRV5gwUjVGQwdFF5biWwFHxQewlnY4tVqU7C1q5tGI=;
        b=FyKIBdPrMhlichQQ8/uJPEct3k+fuzs7qxnNztbwjtWFyKJWZAjgPikv1EOA6WDk3n
         TMF4VlVZQ69yb+GfAFH3BEDrtuX+jvWRhPbfXxqmtDbaFZuSGne5nfk2AzxXifqIF0yd
         VHfoBGsQGC3J+6CCe17XNdIJ5RPbqsf4EC7O5uIF+aqptCTYwaRsOFjMM7WlFIMZLTHF
         aJzzXGkNrAZJYQnvC9BmUmWpw/G3B34BjzAZ6bwY2ga3BTQAQgCtOqmLpbO5O5sMWfvS
         qCY0mdSRjHHTK9K4M5inJZPIESS4YShZ1MGbUY9G6e0MqRg5TCow54Ru3nPDjc95Rn0Q
         KrfQ==
X-Forwarded-Encrypted: i=1; AHgh+Roq+Je6OLeuwsHEuauWeYH/WN+rdqtA3v1v2Qw0bL+lBkZo0ZpzV5gViM+TEbm+3kd5bKzayojV79A=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5NnHptSizt0aAu/AxVsQFXGVA7BxQiA2ukN+AfeLoXGLccRsM
	J3ztJtIdZpx72iZTeD6JvnuXro7g+75cHmi1H9aRbn5uT50bMuUVfTnl
X-Gm-Gg: AR+sD10IUmCqu/p0ITZJb4/kK9c11X5WXGxlr/ZSlYzA2VGI6Ut0y0SwJedMvN669RF
	DzKFMkj63lxcBUCZm3KHNM6otuJeVWHZiKUJtUZqQ+YkW7zpQ1j2smkvqvRr0hQX3MrUA/046wE
	VY+ViUNyV0tgIfZlYVU19aOIxhFDKun6+AWDIle2cLeNOL2gnvdMxjfky70MxRZDBwq6ETfOxSP
	QEr1WWsJdR3b08jm6Nr4zfmQgvvxjoP0l2InYYJFX5FgYj1oRGntgpzaH16IV6JGVTdyQNk6Pau
	sX+2C10lSlv3hgjPfOYHcbHs154l9T9Ig6G6EySy9H+vw93tcKNKJ8sX0QCVPLvy3ivs+5DKOCd
	8+I3DvGv60XejINFMpiqkgrE0hJskAiPe562djK/lY/c2UaljKWWCn00ajo69bI1oRHZtr/g=
X-Received: by 2002:a05:6a00:983:b0:848:4123:68ff with SMTP id d2e1a72fcca58-84e5958eeb8mr6476053b3a.65.1785155961592;
        Mon, 27 Jul 2026 05:39:21 -0700 (PDT)
Received: from wud.. ([218.194.32.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1386sm3036732b3a.36.2026.07.27.05.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 05:39:21 -0700 (PDT)
From: "Dylan.Wu" <fredwudi0305@gmail.com>
To: pjw@kernel.org
Cc: palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	anup@brainfault.org,
	alex@ghiti.fr,
	atish.patra@linux.dev,
	zhouquan@iscas.ac.cn,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Subject: Re: [PATCH 1/2] riscv: ptdump: Move pagetable definitions to common header
Date: Mon, 27 Jul 2026 08:39:15 -0400
Message-Id: <20260727123915.119650-1-fredwudi0305@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <3bb2f519-c70b-6c35-c404-6fbfe8adbeb1@kernel.org>
References: <3bb2f519-c70b-6c35-c404-6fbfe8adbeb1@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_053922_507414_4F9FE0A2 
X-CRM114-Status: UNSURE (   8.03  )
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

Hi Paul,

Thank you very much for taking the time to review this patch and for
the helpful suggestion.

I have split the patch as you requested and sent v2:

  https://lore.kernel.org/linux-riscv/20260727122745.118764-1-fredwudi0305@gmail.com/

Changes in v2:
  - Patch 1/3: Create ptdump.h, move declarations there, and export note_page()
  - Patch 2/3: Make attribute parsing use per-level bits, rename
               pg_level[] to kernel_pg_levels[]
  - Patch 3/3: KVM gstage ptdump

I would greatly appreciate any further feedback you may have.

Best regards,
Dylan

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
