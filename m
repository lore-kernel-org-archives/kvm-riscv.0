Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E41CD6E55
	for <kvm-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 14:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WXA5+fbSeQIAXngLWVCoK/hrvua0qXaF+j1vjGwuyAw=; b=B+lw+vxIVGt1yw
	eSCWGkVQGlfEDs3KkWfbyaPo18uhbQ2GTGKmjIL9HxPURe0Kn1CfHsy0Y99rr8CjmX/4Qp29bMgmA
	StCBPh3b12BvDvAtsDQv7s3+tXpXjEl84B8RlVmLTt8wxQROOYEbfi3OpBap6CNaJNi6wc0ouBkZO
	5AW5+4nebwOGt6+1z3JYX4KtvAqIiJLQFTFz/UNed2zqymdIIVj9SGgzNxXD9P9nzdSesceDm23p1
	iZ3bMBUqvt5dHEUnuqAxftR6VsTrsKtvKqf4LZPeWmnEoTTgQGfEeQ/+bPzszwN8YieKuZ4pjzMPx
	5vpXuGiHiXHXmdjFERjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU3TF-0000000BGjL-2UVb;
	Mon, 01 Jun 2026 14:18:25 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU3TD-0000000BGib-0JD2
	for kvm-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 14:18:24 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2bf02708e8fso31607355ad.2
        for <kvm-riscv@lists.infradead.org>; Mon, 01 Jun 2026 07:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780323502; x=1780928302; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W1xQ7RR3f6W2gygq8YRntn2oji9dZ7t4CiasDB970Y0=;
        b=bikHwUSiSTd8qRSjq+tIAiauwr38INsVNhcHG7AmaiaKuceyTTl7v/7v4cpZd1rUwJ
         1QtEYb0/CaV4tpbVJMkivkANqczQbRcz8kwdzX0PXZ8wO4rKsIyLPva1fql2YpT533o8
         5vdhE9XtkiOCN67yAp/qAjh5lGB/MNDx9QLWHOt5TSp5L4R3BityNVO4pZhk5T1dST1e
         HpKihJGB6ipeYnpqA9cglPI/opH1FRUh24fzgg83CuTiJutdVD+J8Sh7NK7cmGDwoAy1
         spoin//6yiiqC4Jt/eNg/oiBD/MctgA0RtdJGoRWQIePDP6XTavKWUSt7hAWT6iSMLwa
         HxDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780323502; x=1780928302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W1xQ7RR3f6W2gygq8YRntn2oji9dZ7t4CiasDB970Y0=;
        b=ZbklthdWdnB2jiGE51f7oom7MzKg4kjk4Ney6gYOLpj7HgRCsGlCYpWgC66TYvj5yj
         K3woFkxWwwpWVV3ApzxTgfIWBZxbrr5sBBm6Af4HIR491gS1wfikcpc9UKBFlgE/UGKC
         lGRP3dgAFQuQOo1SGxfpn75HvumZCDludauSUIATDMPrEC/zridt0IaXb0pOTwkPM3tM
         lAsjxAQpkCnZVoUCc8Sq85xlXg8+ItfcqJeRgcVs6tHXiBbXe2Tm2DSU+BNAFjVygbPn
         SyzmhKkhvmAg6tyr5AOSph890CbA2GiRAgWbrq0DZ52jySNRvu7SBnzQ1LSstTYuWoOg
         PzKw==
X-Forwarded-Encrypted: i=1; AFNElJ8QAk94YEA3pvJ+temDE4hbb5++h0VWUUyA39edqi0zYJXDcILkDJqFEqQfdPAMNBLdbsp+P16z/4U=@lists.infradead.org
X-Gm-Message-State: AOJu0YykiEJcEzAj4OES9Ru7Wo4gF5/3th3LtfBmUgoqBOEc8KvIrN/s
	kDS5FcQ4HLIO52b86KCtACWwq+l6K/mK8hclLIgoYxIzS/7uoTYUy+Ag
X-Gm-Gg: Acq92OGnVl8FWfW2xzWYys+VxIOwRo9voBzSXoW59hipxuMOY8EyNKrr3VUCgVxeKvc
	dMipKdcRlqa73hXFoAGwQgfKAJZO1vCPpCvJUvH2JWZlp2ZoFOG2guHNGZ8XrenVabh9itsCrCI
	90Gpvv2CqEtp0homqkDroIG26hDo+iayv6XgF+tWGgR0lj40e3hMZuw84F90bMoGDmHGD6hT+t7
	qDeyQ/qSZBWzY30cOSxr34+c5LNQaooAuSlSQVbEOxr3CgtFdQLS9Za6VG2be9tWbaYDYhVxZm5
	NK1lRIXoGfc8zcL5SVVbabqx0k4HpSh5SSzlBHCF0TDT8Lbi8hHWicqojlT5U0zFhMEhAej8OSi
	qOi5pn1vK08dPIdAIUm4J+vsvW2nCY9bYLUThYSwDIgVA+jNG1A/4PeAhJpF6d2K+pNBZvSutms
	GCKKEuc+T57//mXT/rxnFK80KehufiyM8OpA==
X-Received: by 2002:a17:903:286:b0:2bf:2369:a131 with SMTP id d9443c01a7336-2bf368786bbmr133870415ad.34.1780323502187;
        Mon, 01 Jun 2026 07:18:22 -0700 (PDT)
Received: from localhost.localdomain ([2a12:a305:4::40e8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c2da36sm134646855ad.69.2026.06.01.07.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 07:18:21 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Paul Walmsley <pjw@kernel.org>
Cc: Guodong Xu <docular.xu@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Shuah Khan <shuah@kernel.org>,
	Atish Patra <atish.patra@linux.dev>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Zong Li <zong.li@sifive.com>,
	Christian Brauner <brauner@kernel.org>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 03/10] riscv: Standardize extension capitalization
Date: Mon,  1 Jun 2026 22:11:50 -0400
Message-ID: <20260602021638.158707-1-docular.xu@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAAhSdy0pHPAMRRR-Mri735zLu3ymr=ePQ7gA6zZ11BkHEXj+AA@mail.gmail.com>
References: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com> <20260511-rva23u64-hwprobe-v2-v2-3-21c5a544f1dc@riscstar.com> <CAAhSdy0pHPAMRRR-Mri735zLu3ymr=ePQ7gA6zZ11BkHEXj+AA@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_071823_132904_834F4D6B 
X-CRM114-Status: GOOD (  10.33  )
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

Hi Anup,

> Acked-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Anup Patel <anup@brainfault.org>

Thanks for the review.

> @Paul, This patch is independent of other changes
> in this series. If you are okay then I can take this single
> patch through KVM RISC-V tree.

There is a dependency ordering I should point out. Patch 08
("riscv: cpufeature: Introduce ISA bases bitmap and rva23u64 detection")
uses the upper-case RISCV_ISA_EXT_I/M/A... macros introduced in this patch,
so it won't build without patch 03. I mean, if patch 03 goes into a
different tree on its own.

But of course, I can rebase them onto your tree if patch 03 lands earlier
than the other patches.

Either way should be fine with me, your call.

Thanks,
Guodong Xu
docular.xu@gmail.com

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
