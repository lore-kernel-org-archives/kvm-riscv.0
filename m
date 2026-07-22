Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB309C44539
	for <kvm-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 12:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZDgqFCFsNNiyOqDaldaE3vVf1HmFF6AsuBVBoknOy04=; b=UcNeKU4D6PxaA4
	pG/G9ovk2p8xWsHkSSPCGrChF1TZHGJy5QsaiezZnyV4LMoKPY1GsnMYajLYsydS7XZ6Iet1xRDhG
	VTfyvKET9eOe9HQm0czk7KCHP1Qc/4UwDeVpGxr7tL3+7GiIYWzl+2NBdY+OYve8LCNgPSnbYxSid
	/QTDTI09QqAh9P9fZhplVbGh+honrtxjUnRDwHAqvDSpGKsfvLbmdXE16xrHajxvoyvHlXnwphJRi
	w2bByrI03LcfSgytbmbjuPsrpjVuZIWqN5SHwjMaWTo4h4Q/qRVFwZ9cyvJDhBtmmWl+iUNaDUSuO
	if9ptkVxtd79UqLD9aqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmW97-0000000Bm0m-1aGH;
	Wed, 22 Jul 2026 12:33:57 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmW95-0000000Bm0A-0h2g
	for kvm-riscv@lists.infradead.org;
	Wed, 22 Jul 2026 12:33:56 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2cf50c6f235so46691645ad.0
        for <kvm-riscv@lists.infradead.org>; Wed, 22 Jul 2026 05:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784723634; x=1785328434; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QxIfKuOVaE3EcHJclM4dn0Mc9MrDfV6Rgh6T8FHUwMI=;
        b=syGwzo9URj9YElQSGnyw4aHHLNEzhSXumhyHrNA6+9ZJ3TgGwgHzbzMvSHTkF4UmQO
         1S48/f4SLM2gAPqTQwScTaSXJVDj5S3zbBqwvwkUZ8468emIgDlamEacDPQ27tyQBc8x
         4XPveKaK/tRV6t/nbxTUBdL7xxqCZ613wyZb/s9tuJUOKTLzW1sg7vZTw01jcjj4oLa+
         JkYspO5J8O9FzuOxkSLYj//zsWo71EQf8ZOUCpRndKHtkt/XbyCp+DS1kWJ824KC7TD3
         +CcY+nd0/vKoe15D+2Ktl/ru4IpYd/MjbOmk9K1rAsd2CPdcIanJp+29vJey9N3NlR6s
         l2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784723634; x=1785328434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QxIfKuOVaE3EcHJclM4dn0Mc9MrDfV6Rgh6T8FHUwMI=;
        b=LbbwJHhbwgPemE7hJGJ19VZOfQ/LdN7w0faeHhZOuThwm0xfFEz/6vLs7jtvNfgTrr
         GXN7D2/cuF7Bmoq+s+NGGxCxBUEc5H3syFB2bbhi54i5mHWcc40c0+JaGbvzbMyuwqJ/
         Qv2ST7VsQ0xfNDuwdGTBpFQ4865pMPN2Ta+qATMIXTuhzAmyE/o6u+lIKZdYuci+9iaZ
         WQa1R+CwOojXh+hkG+bhI4ffT2viPbY9fki+1A5FN0/fTSZuABi5p+L0rOP3BaHBKUlp
         gMjiPhbWfgBWpfNvutElHI29TihipIso2ly5ad00QSTofZJgpDVnlAFL0769xAh3LvYN
         jejQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp7lFj9XwBRoEaIWYD8hkcsLe1q/+/9Je5t8qiKQnshbgtV71xDrpIvaT5vLELb5nUGPbbPHfHi12g=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywuh+N2zf+a7OrHG6XY6j64EgE/47QTdQ1/LwJjIXcDGnTtDB63
	fLIxyr0CU5VH6iOapIqRVZ/OaO6UFO5chzX+5H6em6rYY4yb+ABiID10
X-Gm-Gg: AR+sD12PaEA5ZMELonpbb4tIpAtm7f7XMqNaOBENrERJaweuTOURjRahmzhOeL82Y8x
	cdQ+XK/m4JnJtIFI3U0bxQg3Zyangw1kPtJOfMor/j9bpmhjYzfZL0yEgIGYYR8Dy+yl2FA2Rzd
	z6NDZ9rHbR7WPDYzVHAfRs6YhdSlUicyoVbh/+kNmwEA0751Pd1tsiIvLzGI6PqC0YpBroSuo7R
	x8mKjBfkJLP1OTTcSsnGY9+NSImAcw2vOc1f577m8oVEfWUQnb7kMDPA8O+/r/aptga1w21xLBJ
	JaTMXE6fDvTmbDnH69baH10nTiFatG9csVnvxtCtyjVAMIc1dprBy59q73U4sYkW+7vS8oSucBc
	4x+nK/eAOb/W2qQzXvFBb/NX65hG+fY4KAuzVvsuiMxObhf3JYQongRAUBWd7GXaquac+Wi4e80
	KtYZsDokJ7fmNmY258M6us
X-Received: by 2002:a17:902:e548:b0:2c8:4c29:afeb with SMTP id d9443c01a7336-2cf348213a8mr249494965ad.8.1784723633958;
        Wed, 22 Jul 2026 05:33:53 -0700 (PDT)
Received: from cyh-System-Product-Name.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf96ac33eesm7214735ad.72.2026.07.22.05.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 05:33:53 -0700 (PDT)
From: "Yuhang.chen" <yhchen312@gmail.com>
To: bigeasy@linutronix.de
Cc: anup@brainfault.org,
	atish.patra@linux.dev,
	clrkwllms@kernel.org,
	rostedt@goodmis.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	zhouquan@iscas.ac.cn,
	"Yuhang . chen" <yhchen312@gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Use raw_spinlock for VMID update critical section
Date: Wed, 22 Jul 2026 20:33:50 +0800
Message-Id: <20260722123350.3697232-1-yhchen312@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717065137.FQ5Ax2W-@linutronix.de>
References: <20260717065137.FQ5Ax2W-@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_053355_203897_01C41137 
X-CRM114-Status: UNSURE (   8.29  )
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

Hi Sebastian,

thanks for having a look.

On 2026-07-17 06:51:37 [+0000], Sebastian Andrzej Siewior wrote:
> Here you state _why_ it must not be preempted. What would be the worst
> that could happen.

The worst case is an unbounded hold of vmid_lock that stalls guest entry
system-wide. On rollover the section bumps vmid_version and then broadcasts
a guest-TLB flush via on_each_cpu_mask(..., wait=1) before assigning a
fresh VMID. Under PREEMPT_RT a plain spinlock_t is preemptible, so the
holder could be scheduled out while still waiting for that broadcast flush
to finish and keep vmid_lock held for an unbounded scheduling delay; every
other vCPU reaching the VMID-(re)assignment path on its way into the guest
would then block on the lock. The rollover is otherwise a short critical
section (a version bump plus one IPI), so keeping it non-preemptible with
raw_spinlock_t bounds its hold time.

I'll fold that into the commit log.

> That part starting with "Convert" belongs into into a new line.

Will fix in v2.

I'll send v2 with both changes.

  Yuhang

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
