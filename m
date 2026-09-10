Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D120CC79FB9
	for <kvm-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 11:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=enum1pYi1PZtUfPtX2LyDXpzRPuaoZrPyoLHvqYNQM4=; b=4kjaIq5ZIqvqDv
	A0Pdz2Svq3kuZsMwM/XJzkIc+CZxhZkZjDtB6rwzRRKD1Gx+0Tm7LKMyhIatgcTnqidC/HagHY0AY
	CVXEh4vn16q/rBR5xmpDygo2/C5Etso8ZYkPyZIHICPPDvCuMh0TXPCW7pBum6HxK1oc0uVg5NEsg
	KGfYEJQabU0hP7zThI2sPV3cxprT071JkS4nk5oJ2n7OmI+al9b8tlMCp9Jj3IEE7qTZEIysuD4bX
	rqSvF7gBwUTbYTZb5m9CWLUscqugV+Yfc6As5+6dwGbit1Pe5qP1Jo0bx/NW89EKGSsozuRUSMMP+
	Qkd1G6ID9zK8ooQJi3hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cws-0000000ECqx-2LHv;
	Thu, 10 Sep 2026 11:28:10 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cwp-0000000ECpd-3afe
	for kvm-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 11:28:08 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-7ee4399c3abso6989679a34.2
        for <kvm-riscv@lists.infradead.org>; Thu, 10 Sep 2026 04:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789039687; x=1789644487; darn=lists.infradead.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Rdvn6SlWN1pYD61UCQmrt7vWGIUZg8DLzgLld4sc614=;
        b=pmqvuGVD4kDnZOM4VF8RLqiA7VQzj6moZH1ck1wRL11iW7H6dETDP1/CMsZrYpe3a5
         3BGXodmD573GRK4XuK7KxmZACPWw9RT+Ee6BYijpe8cZ12auHoR1VFgSYI9aNf8XdHBm
         wmi3QSneXCs7uxf7mXEyf8Df4yyK0lC4XUZD6G0akaFvEAeKBV8Uc0vX8Y9D/5Wp/Bs3
         +cMFPWM+YMo5L5s40MU+fzVAbitcgox7SSvvXBYxyEiTe9mr9RD02UbU+Tr2lYM7d0x4
         Qzx3ybefaFUNCH3P80Pj66p7PcbZRqrT2LBRaqKHcXg1ia77cds87DddcGjpzeca6BRZ
         Wi3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789039687; x=1789644487;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rdvn6SlWN1pYD61UCQmrt7vWGIUZg8DLzgLld4sc614=;
        b=OnSg6YAkjdiIVRjatv++rCinwpl3/+38yFPONpBJIBfy6MKy1Ai1cuMwYvpFQy0fhl
         TZpGfsEThNh/Jz49++AGKl5Fqyf2L2Vlb5yiRbw5nJL5h26Hv7WZSST4TRZpUhrJscl4
         ToUmqDg6lI8kic8gKnQPgnp4hSuuhp3uVd0VQmy+66ZTELTJxJzzsxULaDMwBbDuCvz6
         tn/cN8P/77/df20WqPhMV7kBV7HmjfTY476KLmP402vNZAUxK/bfeAYRYCJHRk6UE4kC
         dAXDjUv4rlax8FvqQ4lKi1mYcdsK0qDDUo68Tzd9lum2oaa7BZZKXf/LY9KjaZVAYzzw
         Ik2w==
X-Forwarded-Encrypted: i=1; AKwUvByx47dIt29IKLQXvb30J2KNnniQfxETK2a1VD77bHn87zz0hnCkMwANwEoNIwqoYDSM42tTaeVFLzw=@lists.infradead.org
X-Gm-Message-State: AFuF++kSVDgBUnu/QHDiKFG+QHpvQueFWivtahwNXstmNPSPNjiRrE6I
	7l9UJa5DcSkT7kcipQC1jGrViNsbF5ZEvosAVxkES+gt19pbfqbeU878
X-Gm-Gg: AYBFou0lN/UnDQgQcz50DHHDIescNi0exmYzge2fLjJLQpLXYk0jh5UhZBmTdXa1pxv
	FSeRtjHy7+5/OMNGUF+0dkNSMNqlYoYr9NzmhoASw+6+brP/qf4Ph9XaZNE6yFFRPXcm5Wgehd6
	T6JAt31oBI+KAbglHW+0PsfgaYn94KFV2CB/AZo0GTQI4W7hTeWtgyIfr7ZJxmf62oov40t6m/o
	4BWxFLxBmif/rGU8myhcGhSxhiAPhCtNTUbgX2PLcSmjrSQDmUJ4l9IL+iuHhM+kOrJEo+a9uun
	UD+5cmTNuJr7tNpPZRVUp3EAcUMUXooQ6xZWByAEpBwGsU4MwNZkMQSVW64qPdcknisPfywNjGf
	vBLGjxBEcrsN473dii7xESUAbENLc/WkqSI+8fRWMlGxlHwTiZ3HOXZyySQdpCJkU+tReFLN701
	+BGWCXlsQCHXIlJhG8dXLOQlFl4k/wu58kSC/BTwMtZ8jhJ/v87+8gauvK/5uKRCG1r87MIJtcQ
	sNTlG6nSFzB+CafcohaNrxYUEPzy8Zi2T0F5TRgU9Li+kdwhf2LveobbWZmm8upUA==
X-Received: by 2002:a05:6808:f09:b0:4b2:8ee8:8a38 with SMTP id 5614622812f47-4b95db6da80mr27637088b6e.0.1789039686755;
        Thu, 10 Sep 2026 04:28:06 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14332405e92sm49398440c88.8.2026.09.10.04.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:28:05 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 18/20] KVM: selftests: Use TEST_ASSERT(), not assert(), in vm_get_mem_region()
In-Reply-To: <20260902164123.2546762-19-seanjc@google.com>
Date: Thu, 10 Sep 2026 16:57:29 +0530
Message-ID: <4ifx1h3y.ritesh.list@gmail.com>
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-19-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_042807_903987_ADAFC9C3 
X-CRM114-Status: UNSURE (   4.74  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Sean Christopherson <seanjc@google.com> writes:

> Use a proper selftests TEST_ASSERT() in vm_get_mem_region() so that bad
> input is guaranteed to fail the test, and with the standard error message
> format.
>

LGTM. Feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
