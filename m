Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED5EC87FCF
	for <kvm-riscv@archiver.kernel.org>; Thu,  7 Aug 2025 16:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xLNVMrp1BeHpBaDy8pB9o8qj4doeVnMRNioFvBLEzak=; b=azQA0DuofzXxij
	oJfCjHX2lLh3r6Xo8+9VU7LZKQ/2PJTzyOimIuIWv8E1arYTqle3uIrjrkafxekMNG8S7I06WyLBR
	9Nox5b6vnk098f/b/7FKXFDa1+oMuYs5D4uTiy18qUb4DPI4nzLXqpnIoqR57r09C+DpuLhiNU0vd
	0h5yr3ztt8VL8CxbtUuB0pJQPvCk0Snmf/bi7GYezoXBhPz78vBI6vcU3P6Vcx9yAB4eQeCEezatz
	t2U4HaUMvNRxJBzKVbGRn5KohmUqssqHurPyE1qM+WRdISfDsRque//QaV4OtQ1UG4Z3EmyWq1ncl
	HU5CN1PMa8tB7UjaGjpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk3Gt-000000016ZV-0H0G;
	Thu, 07 Aug 2025 16:15:15 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk268-00000000uRn-29Un;
	Thu, 07 Aug 2025 15:00:05 +0000
Received: by mail-pl1-x642.google.com with SMTP id d9443c01a7336-2401b855635so8147345ad.2;
        Thu, 07 Aug 2025 08:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754578804; x=1755183604; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4z4lkaExJGQa6xUhK0oOrFgc9NGD8YfgbAanQQBaAR4=;
        b=lywi53ehM+1r+pftjBPx/d1pdMSJnRWtHn+6lD89tmSErgvZEfyoMENGFHFL/p19IL
         CdwkML3GhS5KaVuTkTsOtUHZ3d6cgTgn6chQVjVupQnMsIOdZtHwXlRuWel1i+iC0vwC
         YIb6GzGHqNLAxooRXMC1h5mEME5DWRAt0SwuJC5fdQpbCOmjTMlLK6YDQe31Yeupmg+h
         nR3A8g09M0DB0BDbSajGfzY3utSYreO8B+gJtcS92mrdS948tibBoPAJfbi/RxPq+8qz
         Sa3YCBpYoe3PSPStRtOJ+Yw8pzZdDHiiMyMXOq0PFp0vWc+6Xxu1mxU+U8IajWDEvGYA
         yl5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754578804; x=1755183604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4z4lkaExJGQa6xUhK0oOrFgc9NGD8YfgbAanQQBaAR4=;
        b=hCtXRK4CWymdThIieCtIsdozF2rpAQ7pcxzJUoeCkJP/P9lkZOQAmjTEBgZLSOlO3p
         i9D1wM0uHaAGacqacryexA8R5kpKYBmXQ2xDziILTOE2zqJUpPss5XK4x2qafDQ9lW5o
         H5AMpu8pqTD2XwrgWCQPEbya4vv9TnqbyM/YLpIl1awGU2bA/ZSV5k89QpzsEHvmp5pw
         ra81WPKoNfEXT3uuevK8SvdLp8XBjMp7IhDvbnTNXGsqjoiQWnXinHQwA8WeSdUY/NKD
         eSgJJzZiAdTn2CzlRPztY3vfCG683zE/rhn7CgcnaolbVMYujMLaC2ZJB4T7T2q9gcbz
         4j9w==
X-Forwarded-Encrypted: i=1; AJvYcCX5CrQcyvYIrVMmKQlpU/2UODVD2e/mBzbcQu7PwuDOoh7rcUAQxCvPcP0y7VUYLUnoVcxqGBeh6Xk=@lists.infradead.org, AJvYcCXwQixAP21/hQVE4546adi1YeLDMyYFkOUI1SlqRin4likry6SJ0AeBVzMZKXgDFBjIb70ddJxFfAHRbTI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzCTpGnhTapK+t3QvwHBPnlkeqI/IHqcHTxyOTy/SQRpgmJ+xbq
	Dfqdpn7c3ZIVija/uEeYukGPJ9tsr8l9SgQcXmoxi13AacCUsVBNBVgQ
X-Gm-Gg: ASbGnctCCljEa9MYWq0C3GZya3UGrxdqr/TNG6M87O7b2mPcSwRzvOZDDJoCUnvYEMZ
	Pb7iv7rZKobhjHW/2hF/8HxkBhan+1fpjwmAQRT/BUHThTnjGh1K2D6ehX5Cmg/eIE3T6ZfYG9A
	+KilLoxZAv/By8+lgWbnOmJ675VmUjMA6OLG/FnA7wgdZjqQL0elAykQZEvwDllTosyO3ww+V9C
	VJwx2C14k6bkmYQk74LQFNJljLmxBzxPaPvtTXyLlUypM0j4u3vU364sOpPwTJkFSLcB/32yddh
	DfBsZdqpaGTp2h+oDNyGWxdNfuJA3AYPZxMCy/l28K8o+nEUOul4l6I/diVCEM9Niw/I2keNZit
	n5oGvAeXVGBuO4z+4zBPvv+YOp95VHOjRqQ==
X-Google-Smtp-Source: AGHT+IHYKZPCa1POt5mQeBQy7unYv4f+f4aAU182ddbCIgcADG5cdt3Op31qO/JMqsF9OMB9zbtIXA==
X-Received: by 2002:a17:903:120b:b0:240:2efe:c384 with SMTP id d9443c01a7336-2429f2fe7d1mr97453305ad.19.1754578803600;
        Thu, 07 Aug 2025 08:00:03 -0700 (PDT)
Received: from days-ASUSLaptop.lan ([213.130.142.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8977896sm188254875ad.79.2025.08.07.07.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 08:00:03 -0700 (PDT)
From: dayss1224@gmail.com
To: kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Dong Yang <dayss1224@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v2 3/3] KVM: riscv: selftests: Add missing headers for new testcases
Date: Thu,  7 Aug 2025 22:59:30 +0800
Message-Id: <cafaa0b547d4a1fc45a38753038c011ea7201d04.1754308799.git.dayss1224@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1754308799.git.dayss1224@gmail.com>
References: <cover.1754308799.git.dayss1224@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_080004_590609_1BAAA891 
X-CRM114-Status: UNSURE (   9.67  )
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

From: Dong Yang <dayss1224@gmail.com>

Add missing headers to fix the build for new RISC-V KVM selftests.

Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Dong Yang <dayss1224@gmail.com>
---
 tools/testing/selftests/kvm/include/riscv/processor.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
index 162f303d9..4cf5ae117 100644
--- a/tools/testing/selftests/kvm/include/riscv/processor.h
+++ b/tools/testing/selftests/kvm/include/riscv/processor.h
@@ -9,7 +9,9 @@
 
 #include <linux/stringify.h>
 #include <asm/csr.h>
+#include <asm/vdso/processor.h>
 #include "kvm_util.h"
+#include "ucall_common.h"
 
 #define INSN_OPCODE_MASK	0x007c
 #define INSN_OPCODE_SHIFT	2
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
