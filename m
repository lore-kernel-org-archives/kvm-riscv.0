Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C79C87FCB
	for <kvm-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 20:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tWYicApR4gPOADwYf/YFeMmNqMUUEdugCLYjn3HBqdg=; b=AUHtOEbQvwh08g
	sBuiBOXbuL1Y7e5LCNY42dZqrEa+mbfmDsfC3vHB7PIhqs31WbnOtXsniEz4ATC62sXlPOSguRI3j
	PELpX2V1EzS9gRf724G4TZ+pCMnCJy8CXqjzPUduXequNWSEJuNskfUW9N9PXCapU7sVJp0cnBQQI
	IICjiwaS0RhHrHUeNkGbS575fUmcc+B7OJYOc9eyFtd+VsKYi2CnY58mb+hU4GOwK23ER7kmS2tm1
	hCimNIKFZmo7XY3FTKSHwjH/fnsl6xV0vEZWZQakkiPKso4Il5IA2/ePpwh8vzM1h19lHjCq00hWE
	auL9Fewe9NJeet+vwR1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkRJ-0000000GKXm-09Sn;
	Wed, 06 Aug 2025 20:08:45 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkGV-0000000GG5R-0jYY
	for kvm-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 19:57:37 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-76bf30ca667so529432b3a.1
        for <kvm-riscv@lists.infradead.org>; Wed, 06 Aug 2025 12:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510254; x=1755115054; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=tP9GWyHDKyhyNham1AJeXmzoVBEhNFAEzN5Uklpk9I0=;
        b=VmByWW2FsMtZOhK366pwG9UV6CLu82P0XWQvhu7+9QRESrLZrY5XsCF2YCWfqk3Uz5
         MeEI3bJFl6Ozs8ogutd1MDB6eVjvn+Ka6iv1chhC7GSA1zXaxqb8Hxw6T+NfGicbvRmH
         NrBxYz6Zgajx/fcWGJYW0nL3gkrX34Bl39v4jwHyEkv/FnxkeQg16vtoNa8/MIOjgzgy
         x63gCjAQh2Kjx5bBuhRbEM3djTx9zXG9uGfbb/ss2dF90PD0tpESUTcuIP+mq7MyOc0l
         yLel0tlOX05zhHMxIxXCIdkb2JVOtasRKaIoV4vHDBYk78598USbDM+OSUJA+Gx1nwvX
         Hmgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510254; x=1755115054;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tP9GWyHDKyhyNham1AJeXmzoVBEhNFAEzN5Uklpk9I0=;
        b=Wd4Z8GnPSZieLuMzAyT/1glz0gUcW67L3ThlXf2fMl51RqL5tOyQEpLM3L+YRZQ68p
         nOuCeKk78yQztbJBFBvN9Nun/rBYwZjakBX8HwTdazeGH+whaMjEhYc854M4hUXC/Hsq
         9J9qdn6xINruBKynWXjAhcUYLv5G2JuN8PQL5CJKwvUntS68u5gQs/F/Crr9ryjVQ3Pc
         seryjWejfci45XoTsaEYh7GmHcWPwsX3dIgtBMcRDO5ja/EePGo6ip0NOQFbhG/YVRH+
         FqixNmZ4jSG0bJVT6dDTntxR/rwYKO+Gcg0d1TvgAJQmcw0mqkWXepG5JpNTzxKde2Wv
         FEBw==
X-Forwarded-Encrypted: i=1; AJvYcCWPC+TXHeHpUskGvrbGDf4wyoIKnb1nAyOWcnVmYXxf8ah44O9/wO3FueSFWLzaK+u+8O8Hfl5mNgs=@lists.infradead.org
X-Gm-Message-State: AOJu0YyS/oaScRw169xhZuQQYd3HkpNAqUuYLr0QGSC87HG7kbDDM+vL
	KFQl4/oApOaJZIT2OsYX+SMq0bPN0+B5NNXUvHgMA2vqArNmOMCEs+inNcU7rJslVGq/5DBtyMb
	3hK1Lxg==
X-Google-Smtp-Source: AGHT+IE0CEB3xtAs9hI54+H7B1IyMBLcepknW0FCY+2mxv/eXxKsKgLhnBmg0Z6EMAhWWlTkD97yQMZQQo8=
X-Received: from pgg21.prod.google.com ([2002:a05:6a02:4d95:b0:b42:3ec5:d919])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:5493:b0:220:aea6:2154
 with SMTP id adf61e73a8af0-2403125bcacmr7040722637.17.1754510253905; Wed, 06
 Aug 2025 12:57:33 -0700 (PDT)
Date: Wed,  6 Aug 2025 12:56:25 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-4-seanjc@google.com>
Subject: [PATCH v5 03/44] perf: Move security_perf_event_free() call to __free_event()
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Kan Liang <kan.liang@linux.intel.com>, 
	Yongwei Ma <yongwei.ma@intel.com>, Mingwei Zhang <mizhang@google.com>, 
	Xiong Zhang <xiong.y.zhang@linux.intel.com>, Sandipan Das <sandipan.das@amd.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_125735_227743_AEEC347F 
X-CRM114-Status: GOOD (  12.77  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Move the freeing of any security state associated with a perf event from
_free_event() to __free_event(), i.e. invoke security_perf_event_free() in
the error paths for perf_event_alloc().  This will allow adding potential
error paths in perf_event_alloc() that can occur after allocating security
state.

Note, kfree() and thus security_perf_event_free() is a nop if
event->security is NULL, i.e. calling security_perf_event_free() even if
security_perf_event_alloc() fails or is never reached is functionality ok.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 kernel/events/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 3a98e11d8efc..1753a97638a3 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -5596,6 +5596,8 @@ static void __free_event(struct perf_event *event)
 {
 	struct pmu *pmu = event->pmu;
 
+	security_perf_event_free(event);
+
 	if (event->attach_state & PERF_ATTACH_CALLCHAIN)
 		put_callchain_buffers();
 
@@ -5659,8 +5661,6 @@ static void _free_event(struct perf_event *event)
 
 	unaccount_event(event);
 
-	security_perf_event_free(event);
-
 	if (event->rb) {
 		/*
 		 * Can happen when we close an event with re-directed output.
-- 
2.50.1.565.gc32cd1483b-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
