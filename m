Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D98606A682
	for <kvm-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 03:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pwaQYi8o;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tvfj3C6x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=c9T7U0W/k7Y64QmJ38KSX252RWZLs3vRxuArrXh9ypA=; b=pwaQYi8ouszStkFqFA0Ep8/FzP
	ydI4ofdFYoLTcOs6ck6abFy4q/Gr1TC0zgRdkegAeG9Hoi0kZtT6pwETJOfRzqI1xa3G0fCj/kfHv
	IQitJEHTAWXlHRd7xP+XZdhizIwciS2yucHpSXFVujYe9jfQVCuW43783ASQLFOCI5r5Z1lPWiKXo
	aN1ZTCzkzr8Pe3SvAC8d/ot6PNTWVWfSxae3aHlHKLszeLKueTkTS3lLZJRgtkLHXQTzbcTc16xKe
	QBaY9h1drB+Xkip3rq6FWm7vlEYOzsSTAdUlS/LuF3FxSr2pxAVYiwFeP/mTKtx0tQ1ktQNhPaCZe
	iuMDkc5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhHf-00000005RcE-3Bqc;
	Tue, 24 Nov 2026 03:33:31 +0000
Received: from mail-pj2-x09.google.com ([2607:f8b0:4864:39::9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhHd-00000005RbG-0Fji
	for kvm-riscv@lists.infradead.org;
	Tue, 24 Nov 2026 03:33:30 +0000
Received: by mail-pj2-x09.google.com with SMTP id 98e67ed59e1d1-3b3fb6d5edeso746566a91.0
        for <kvm-riscv@lists.infradead.org>; Mon, 23 Nov 2026 19:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795491208; x=1796096008; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HtQGXmDLK1knncRVdCTkTy3fQnI6z6mdkboXAFgFAyA=;
        b=tvfj3C6xp18+Q/dbanphNBmALVppq99aqXVd/S9DoDGmdrdTJO2B9O/+QZ47Wv3GT3
         +pWqtUjnM+Vrd9ZyUf7IoywyDDmukl+4Bl1lfzVFDBMbf8pGbNcjwAOFtru6PD2hTwtu
         v0LJ+5suaip4qepQJLkTeJiU3gH0/K608AhuuDSPJ1wQA71mgaU2efA1lENSpaa0xFRv
         fWyCst6JPGRF05xSq+1zwhBTSTQyUY56E/6td7WEalPt5gB0O2S4UO1/fEW2jdJ3E8m9
         PpR3BTioAokLlCfsEUIjKUQ3qOgHfGi0EGSNANXdi2LuKFO5OTspuJc5//dfunAmp4p6
         CLBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795491208; x=1796096008;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HtQGXmDLK1knncRVdCTkTy3fQnI6z6mdkboXAFgFAyA=;
        b=IGA1cVORc8VjHZtA/Iuuv9dlaDM1mpbLuTtPlaVq6fE+lH8p5mlb403yFyQqAwKi71
         LfIpOMz7udv/Mht5IFmCQPSCt1XKMb3Pxn8STXhIwdLe0cDA+AsqQdlED4MQupt32+D+
         TsM5OslhWVhv+aHn8+TfYdmo5ba00xOZ1uvFHlDR3KXnXYTFamMHNhgDLzk6pJp5R67X
         8uMFpI9/Fg+7rA16fZeKyXXtjGVxSoqxGulYLWIC97igKcxyvBOvycCJwyW9uHPjickw
         4B5PwmXQGoEOUVI0F95Yw6AiysIwy9lRTD0MIKndfWb3Yb4HY4dHg4s4EbzZgRYKVkDx
         7xoQ==
X-Forwarded-Encrypted: i=1; AL+hErHRJ4ulyjUMTyXFWM1KGx0//QXMelMfz1c7aAi5vpX9iP1ZKFfo+af7doxqOrBdyUfwDX05lb68i0w=@lists.infradead.org
X-Gm-Message-State: APuU4Z8egbWmRKw1KJZxV2J2p7EGG/BSUr462QUsIjTGIrix+tnEIQh+
	6hYWarNDOldhfAVgpXpcOlD8BuZyzCCBjE07soYIt1Gy7hsEYfe914NL
X-Gm-Gg: AZFdTZeFD/YX7KWxdfAlsTpTYnFGt5eHTBitBbtDpcBogDKsp0UMgNbpPLNykzgs+kY
	mLVQiC4mk22ZII/+cxLRNW0Sscd3QaBxG8zbgHHYDO/ep8WClIApqFLnB4dkZxT+1Vr8IJN8UdX
	WWmJmx2WNPLpCdUdhtpCnnB84ZugNYwv8WrAI0hqDVSaP9RBTZfX0FCarc0dOKHgz/1CZi+d8i1
	ZcPTqaYt9wJTUopfqVPTG3XhUKhKOTDmYDrEM/PFxr9dKJ++zyHf+J7BPRcx6Wi2UrjNPSSmyQE
	mxcaNS1ragSPqxTmDhavoMgr2DnEbW+XIa7p0HzuGhe7cyKusNzB85WkmeMaZoXIHcVwIyGRWs/
	hfM0JeY+QUeIef4LopaI49yEzYUvYglYvDZzZ3lLzMbVVQviyZbdO4q9Uax5JdDB2Rvqe+e18PP
	9Eih8H5sOd+x90yRHSNGpNRFSijEVoQBotg5gUX3zkXq9qQu+c/dmHgdaewT/Qlh2aFk//RsSbU
	UGwY7Of3/wCU32RjhiK+5CFFo5DdsYdwiWSSO73oLLn1Ih4QziwsbSVawSg56/1C2uJ0TSeFNe3
	Ay3CdmypJfXK1RehTxZrbPDlBdN23HbQqFLpfNBs6g==
X-Received: by 2002:a17:90b:2247:b0:3b1:83aa:5b53 with SMTP id 98e67ed59e1d1-3b41c98a1b0mr13226363a91.58.1795491207740;
        Mon, 23 Nov 2026 19:33:27 -0800 (PST)
Received: from q-Legion-Y7000-IRX9.. ([223.86.210.47])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b217a5bsm9122009a91.0.2026.11.23.19.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 19:33:26 -0800 (PST)
From: Bingyu Xian <shanbeeyoo@gmail.com>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Quan Zhou <zhouquan@iscas.ac.cn>,
	linux-kselftest@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH] KVM: selftests: riscv: Test the SBI STA shared memory lifecycle
Date: Tue, 24 Nov 2026 11:33:18 +0800
Message-Id: <20261124033318.612773-1-shanbeeyoo@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <av77j8rN593sxIDh@orel>
References: <20261115085457.889873-1-shanbeeyoo@gmail.com> <av77j8rN593sxIDh@orel>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_193329_098741_FE231F7E 
X-CRM114-Status: GOOD (  10.12  )
X-Spam-Score: -0.1 (/)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Drew,

Thanks for the review. I should have separated the scenarios and stated
what each check establishes.

The enable/disable operations are used by the Linux RISC-V guest CPU
online and CPU-down callbacks. The selftest invokes SBI directly; it
does not run Linux CPU hotplug. Hotplug motivates disabling and
re-enabling the same area, whereas active address replacement is a
separate SBI transition. I have reworked the test to cover disable,
re-enable of the same area, and direct replacement of an active
registration separately (v1 disabled the old area first and missed
active replacement).

For dirty tracking, the intended property is that KVM's writes to the
shared page are recorded in the guest RAM dirty log. I have moved this
check into the common per-vCPU test path and cleared initialization
dirty bits before checking accounting writes. main() no longer needs
the added #ifdefs; architecture hooks select any protocol-specific
lifecycle cases.

The update checks now arrange runnable contention on the same CPU with
bounded waits instead of assuming every KVM_RUN advances the sequence,
with a small prerequisite patch making get_run_delay() fail explicitly
if schedstat cannot be read. The revised test passes on RISC-V and
x86_64, and a local control omitting the STA accounting dirty mark fails
at the expected assertion.

I have also dropped the MADV_DONTNEED case, since discarding page
contents does not model migration or establish a content-preserving
backing replacement scenario.

I am posting these changes as a 2-patch v2 series.

Thanks,
Bingyu

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
