Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF39C55182
	for <kvm-riscv@archiver.kernel.org>; Tue,  4 Aug 2026 02:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KurpODXe1mw31IjJg3oq+9n6YqGR+IXpZPGw9Qs1YYg=; b=V5go1iUOOWF7Ld
	v2OqHgeZXfNbQe9cIsVaY3wWrZd5vTk4KM87jti3FqFIHgwHqn4XcSXyCLAHKXDxao6ngSjpTE3Ry
	vMlHaZ3zVlNt2kNhz5MQK4mogRcUicZS92FY8aBcUMc+ZInihfSUxPFXLWfRh5Bf0t0wDtZd4j1o/
	gF8wNef5q5v+79GkN54hxXJl5shqjzjv6SuLwwYLEFOXWpQa2r1m7SGxItZGUqm6MeQ8nAdAaSrGY
	am+S/dc3dTyfHa9QPutmpbuUSr879R7uJd+1Ot2EfzuDP/oPnxvbSuosY/W8nohHzBGvrHBLE7WK4
	GImAqhzuM3PPXlMDVCPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr5Cu-00000000s0W-2Fuc;
	Tue, 04 Aug 2026 02:48:44 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr5Cr-00000000rzX-1KVm
	for kvm-riscv@lists.infradead.org;
	Tue, 04 Aug 2026 02:48:42 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2cfff5f88dbso47030985ad.3
        for <kvm-riscv@lists.infradead.org>; Mon, 03 Aug 2026 19:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785811720; x=1786416520; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uu48l08iOiq9g5Bc53dhkabEeR0zOJy6W3JS0tzyMbo=;
        b=o2K8CUezVV8PtqsLEpB2nk+qVbaWMt1RGSTC2WoArqRY+/dtskvWIWHvLeIFvEt+ed
         i9MBJbRCdBr4WYnGa1Z1EYI+oPr6nL/dq6nxpVX3anLnNL3u4fYZRpmev5N4qK6C0rqP
         zb4M+lXZ/mofPSRxrjjBSu+y28Zl7UgxDNj3yRcGvq4X65gYWRcdjPQ4gloivpRvNGYW
         V2LTvkiB+qnXWsaxGtigyreSkfxXEVL5/03CACjAW8dsWDvaCulh7cHkK6yN23n4hit1
         rFdk8aS0aPGM2M1p+u9H7qpuy78I4+BWJ/BQXxbanXr24u1KsRBD4qTnOvHzS52HyCfc
         f7Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785811720; x=1786416520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uu48l08iOiq9g5Bc53dhkabEeR0zOJy6W3JS0tzyMbo=;
        b=oDXD8gZSGa2Q/RIIVlIbFwYU+YRAodyky6MdWzVk86R1hJ9NZ8VaDb+Q4VbvkRbvYN
         kYZnvkOx1hl0Eoddc4vk1jPBiTdb7D79MHLlmFTFPQN/G05KfWST9oOk6ayKbQHen7ze
         0rgqcQw9nVVZOjfmasuk2L7YS/OB1jP5acpW/N3ANSXoMHGfo8O+AUUJmi8ENZBSLv8l
         MWfRvcVDE66q3GvBW6rZ/l4Kd22swLm+Oo+KJoqPeTizfzzDZ3lW1E5BA+qNnWeY5j4J
         KmFQdP04p69iSdl2ZU5LsZ7YTwXdP1jePUX6fOi0asbh8BXjnu7zu5T994mlVUg8PN1G
         HmJw==
X-Forwarded-Encrypted: i=1; AHgh+RrKtZKD45+gKSsfWxoY+JnvctsjOGbK2MUipm5kPTwX8mTXXgX2a4djqnpQRQMbNb2BobNEKHDzZkE=@lists.infradead.org
X-Gm-Message-State: AOJu0YyKRyTXmatJYisfIp8b5gPe23/w6reWx06hBdrOUXaZoTWaTzkt
	k+WNfxcYmZEX6lUBhpW82uClt50ELotfs4v1JPo/Ue7pzn2LnE+D/F7TT43lp5dH
X-Gm-Gg: AR+sD13ndUxo29XKp9iwrWJ2B/NpA+KPOv//b94HSIOH7iTVsvbTJiLeHsqh/U9ADE6
	cpAYcg8+QowoTnfBrTFmMKw+/Na68d9gBs3EA/X9fzHU7CqqcqHEi1gSU2UGRQUXfPHhjn95noj
	t6MHdxuARak7rrtVPJRWbE+aQumT/kAkzDNZukeF1EPRtbVb+A0t7R1l/wMxGBKPjCnZxMGYnlT
	yQdlp9HMk1JEb3bh6/h2JYckQBzRjeRA6Udxm6iijhim+EFsOUrHISGYsWuc/lBVPE1WzHA/wrc
	pC/lHsvTkXHIlZCxRTo5PjvWIt9rKioUUMZwifKd+xlKBmR53JF+P6ew1l0UISxTMpK4yMDtIKb
	I9vKHbRdx7BXLInVfzyyuvgtYLOC/BTOsUF7QdMPrK8IhMkTLxCcIrdNbITTatSJGmywvZrPWeO
	QkF8OLoIz0HvHGTDewzOUw1T3q0wLa4g4YnHey9wn7B66AyvnttaWIKvSxL/6h491o8EREO/okp
	JWsb9k=
X-Received: by 2002:a17:903:4b4c:b0:2ce:6d4a:5b8a with SMTP id d9443c01a7336-2d05242c4a2mr121069295ad.38.1785811720247;
        Mon, 03 Aug 2026 19:48:40 -0700 (PDT)
Received: from cyh-System-Product-Name.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae5a91asm44837315ad.21.2026.08.03.19.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 19:48:39 -0700 (PDT)
From: "Yuhang.Chen" <yhchen312@gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Quan Zhou <zhouquan@iscas.ac.cn>,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RISC-V: KVM: Add kvm-riscv.wfi_trap_policy to control VS-mode WFI trapping
Date: Tue,  4 Aug 2026 10:48:22 +0800
Message-Id: <20260804024822.2401012-1-yhchen312@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAAhSdy2r8Ei9ESdSJB8McC1T=Atp0yNa2MxEbOWNVRTUM_8YFA@mail.gmail.com>
References: <20260709115610.287420-1-yhchen312@gmail.com>, <CAAhSdy2r8Ei9ESdSJB8McC1T=Atp0yNa2MxEbOWNVRTUM_8YFA@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_194841_354450_2851E389 
X-CRM114-Status: GOOD (  11.54  )
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

Thanks for the review.

On Tue, 28 Jul 2026, Anup Patel <anup@brainfault.org> wrote:
> This would mean that for the "notrap" policy the VCPU would never
> sleep and increase host CPU utilization even when VCPU is idle.
> Is this expected behaviour ?

No, that was not intended. With "notrap", HSTATUS.VTW is cleared
unconditionally, so a VS-mode WFI never traps and the vCPU never reaches
kvm_vcpu_halt(); since WFI is only a hint, the vCPU thread can keep
spinning even while the guest is idle - the high host CPU you point out.

v2 drops "notrap" and replaces it with "auto": HSTATUS.VTW is cleared
only when the vCPU is the sole runnable task on its CPU
(single_task_running()), otherwise WFI traps and KVM blocks the vCPU
through kvm_vcpu_halt() as before. The default stays "trap", so there
is no regression, and the policy is re-evaluated on each vcpu_load() so
a vCPU that stops being the sole runnable task switches back to
trapping.

So to answer your question: the vCPU no longer stays busy at the
expense of other tasks - it either blocks through kvm_vcpu_halt(), or
runs WFI natively only when nothing else needs the CPU. On QEMU TCG,
host CPU stays around 5% while the vCPU is the sole task and rises back
to the trap level as soon as a competitor appears.

I have posted v2 as a new thread:

  [PATCH v2] RISC-V: KVM: Add kvm-riscv.wfi_trap_policy to control
  VS-mode WFI trapping

Regards,
Yuhang

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
