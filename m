Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 642C4CF45B4
	for <kvm-riscv@archiver.kernel.org>; Mon, 12 Jan 2026 17:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=eBq770EMOCxIR3OTeMa7kAEDsDabQCt+vQHvQ1XtAPY=; b=pTWoXAME0eP4w6hezkla5cPn6c
	bqGPwSkuQQTUFoRUrPqScRCi/aB0pa+biKmPWR9jQ8YdTpRlgtfhDRES5pYSHZImsQjJdPRG8sv0W
	XPp/gMJZe1CCShhb0Y+1PbsWv/dJRcUIKg5ayBiTyaNJzBRYTDPG3JGWo2uXypLNBuB2ZkNgfg2y2
	D18JHc5rHfyQlMC2B2rM9oNWEIEQieypyIXj7OR4gGv4K0olxGaW9NaiO0nQ0+DeATJMAw9v2sFBW
	gzPzNTd4F4bmfo24wNhnyK2IKpvT3nYHJHoK63WLjOkj+oE6hMJAYYMHiDfItCJM4fJ6gWZUeiOZ2
	foZvr/rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfLtR-00000005rqD-2LBD;
	Mon, 12 Jan 2026 17:39:53 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfLtO-00000005rpD-3p6L
	for kvm-riscv@lists.infradead.org;
	Mon, 12 Jan 2026 17:39:52 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-c337cde7e40so3682543a12.1
        for <kvm-riscv@lists.infradead.org>; Mon, 12 Jan 2026 09:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768239589; x=1768844389; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+PjBpIA3ZO3sQJJLy61/+UM/sv023xJCPIJTeEkES88=;
        b=4OWVwcdDR8Y0vD4/hIF7D4uX6ocK39/lRxeE9N2pCU1yosvtX0KIS1m0vrKnXvAq0p
         fOsGIgLKJA8v8kl7FenDPKnx5y8RccaxUzPr9ec82pznBxLdtc3ohVMLlcod0B98NUgI
         +d2D0QF3aJqJNg/aYtrHgPkwme2RyOGn6rru6MBEokNJiboWDMf9AJGdDD4ZWhtc/0qj
         SwJQq8BKnzihRJATMy6AtThTTTilpxlqXhD9m72vQtp+CF8Wo/MNDdSpLWI2vfFdsm7g
         J84Q1soFaoLBnbXvaO+v/WyeCOI2tfnrBUXqUxCxDxbtE+bCYtFqXgoQiKyCipsC/bON
         VX2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768239589; x=1768844389;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+PjBpIA3ZO3sQJJLy61/+UM/sv023xJCPIJTeEkES88=;
        b=NsJ8CKXJtW0wDpm0MfcJFiViLROv8Ym/QVF0f5e5wzQ2xp+8Lr3W5cn3rF69psHjeL
         JWjDYtU8n7oD+eKt/F6Xp74hQbTRKeqogwlB8psDFpe3BHfjYNWeeyBIB24rkcbEuPHk
         TcHce0f7xNwvhuSK4Z+M7Rm6w7S+7ZSKNqtC7wY1Wv73iGJH5Z0GOGjj0S71RKEe2dUm
         AzgC/gi0XbK/LMkgSNkB5Rud2nk9cpNNhNMUF7oiddomsFv7jDTQw2RW6DrQkBZ/ux4/
         8B4EEwaR3HXXi2xDLQjUl48igszjFtcBOR8Ibg5YI4NDiESCE4i2+aajqZ3/7mc9ZeKE
         ifVg==
X-Forwarded-Encrypted: i=1; AJvYcCWNhQ7+9Goe4z84R1lF+Z5yWRXZIQIXi5I5m+2/vE7qG+LmZTqJ4uleZ8X1eGnCDf4Z1SMytPmCVp8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy85OFQ26sAFMarOb/IrR7+2HxEN4c7/p0TY1FFTzrmIfzV1yss
	Jw16I46IypCEvy6LckBwpXgvomstYGKwQSI2I8P3sl8VaMBhjRV9MCH7gjHpBWUcoHhnRgoONdm
	vvstelg==
X-Google-Smtp-Source: AGHT+IF668cUxxhKhGHv90tNvsIeTkhAR6ns6JG1hxt5u/yIlrpHwYKq8uhAaCwc/umnpMOixfg8y4oIB3A=
X-Received: from pjbgk17.prod.google.com ([2002:a17:90b:1191:b0:34c:489a:f4c9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2251:b0:33e:30e8:81cb
 with SMTP id 98e67ed59e1d1-34f68b65ff0mr15047069a91.13.1768239588965; Mon, 12
 Jan 2026 09:39:48 -0800 (PST)
Date: Mon, 12 Jan 2026 09:38:38 -0800
In-Reply-To: <20251205232655.445294-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251205232655.445294-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <176823927133.1374677.16641795988105461817.b4-ty@google.com>
Subject: Re: [PATCH] KVM: Remove subtle "struct kvm_stats_desc" pseudo-overlay
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_093950_953353_A1B5FD5B 
X-CRM114-Status: UNSURE (   6.85  )
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

On Fri, 05 Dec 2025 15:26:55 -0800, Sean Christopherson wrote:
> Remove KVM's internal pseudo-overlay of kvm_stats_desc, which subtly
> aliases the flexible name[] in the uAPI definition with a fixed-size array
> of the same name.  The unusual embedded structure results in compiler
> warnings due to -Wflex-array-member-not-at-end, and also necessitates an
> extra level of dereferencing in KVM.  To avoid the "overlay", define the
> uAPI structure to have a fixed-size name when building for the kernel.
> 
> [...]

Applied to kvm-x86 generic, thanks!

[1/1] KVM: Remove subtle "struct kvm_stats_desc" pseudo-overlay
      https://github.com/kvm-x86/linux/commit/da142f3d373a

--
https://github.com/kvm-x86/linux/tree/next

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
