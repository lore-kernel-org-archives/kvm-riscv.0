Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFF5C43602
	for <kvm-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 12:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wOeRGIiNd3nax/knma4KLVTyQ8yESgwY2V/8wEbd1zo=; b=z4P6N+0WlcSUPS
	gY9fndXTkmje8i3qRChklQBg5+SrqFQ9OTNno+0iedSb1Ohu7mwIdkS5ZQALgzGd124EvEKOgHC2k
	vQ5O4uhXdC7Bom7EDZ08XTJoxpbUEv1BxfJkPxSCBVmmo5X7hW+Z5AB612tGNFh/Ao6GepfctVnF9
	5JllAdRuFBTVaSZGJV3j4H0i/CmEeYB9yXND56JUll0e91Lpb0XA3wXxZpIR2pbG+Y2+2tfM3XO35
	/NNvPagdohD8rqOVEXXIuSF6jqRQkatELsOK5fwtYD3i0pgiJ2IZHViLZe5ydt4/Spl7GHbxCuLhZ
	H0ZHa+mxerQygsjPPC9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuRF-000000023VD-1dOU;
	Wed, 01 Jul 2026 12:53:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuRD-000000023UN-48Dk
	for kvm-riscv@bombadil.infradead.org;
	Wed, 01 Jul 2026 12:53:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=EHQ0LcaMXNLnejiZpmBDaHZFQC9wnXmjmMb8Eu8ttio=; b=jKVxx7AN3yVLn0PCdvSKpC/w87
	vjqAdejKlr9ovCfBTQc1kZtKanxMAhy7PGd7ZXcua+w9YtFC1BKzdKFf/AH8X8DV4PaP6NupxVv+V
	oactqA6NvpyCWFInQIIn0msX8uHHx75hAwSiR0GLV/L8VmnzBnx+Sp/je4Mb/+Ca7Q85S/sMA/rIj
	b9FXSofMAcNBlalDksyWLt1TxYvkn2ps9ISRnv/Ethw1HqeVKsA+woGM6H0TSZy/OUOjrEPil1yX1
	0n+0SVKPvtKPKoOxsgzFp/ob35GuRy2x8ErrstSvuLVOVkb0tF/lA/b0QNdANVsQ0A6QMBhxH0LBH
	Y6sA2HGQ==;
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weuR9-00000002mQg-0RNC
	for kvm-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 12:53:10 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso464870b3a.2
        for <kvm-riscv@lists.infradead.org>; Wed, 01 Jul 2026 05:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782910385; x=1783515185; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EHQ0LcaMXNLnejiZpmBDaHZFQC9wnXmjmMb8Eu8ttio=;
        b=rlH4+i/QbqtrlUpCdEWmERVY4LPL000UHWI9BdoW95LbgZSvHg2cm/YFEbSYNzbTNs
         YJkhmeQF/5BDk3ClWAcszGjuAIf79vTjvtSbhwp/dViyuQ9+p+WpLAGf5/lEjDYRqbuI
         Hw0JoKaCP5DLv/xPR7SzzhD4+DKtcdBvDyPJD3h7OREP6t2Dv0Xu/Hgj55BMU6dPB5K+
         Cx5vMfGyaLqRWDA0dv5Qlt3RCYttnG1F2HW4cAoWVdpmcdNFNfEpfH+a5/BdThVKtHk4
         4EIDcgyBckRnfZO79esyjUjWA2BLk6LnQmNn3UuJuiJc7MOmrvMeW8Wi4cCrXOU2xsWM
         CdcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782910385; x=1783515185;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EHQ0LcaMXNLnejiZpmBDaHZFQC9wnXmjmMb8Eu8ttio=;
        b=jtr9hN6NVVhwOftkr+cWMkbTXQ8hWHTyJLQgxvNsfuFr/sNqPmbDFyiU1vP9UDNYJw
         LZcGBwW/wdbHjXeULxDrgzBeevTfroHcJ6EMyKeV5xW06xKb9w1atihKMAoX86pFS0D9
         kKGEWNUKu5bWMpaSEDRTiy26Vs6+s6gUbNtd9QMjBonBpnRCeD1yWcRvbTzNozWzbtdd
         XzQxO2tXx1aL6cOa9HR/7x8cgUxCBsqWOy15lPmfYhVm1f30lUj71DI5K8EQ5GqMiwpe
         9N00NA/CN0wAWnLLXop1WikhZ9tDd7HsIGhblLqSwHQsEBumOY8oBjqNY3RLS3hyYF8R
         3Kxw==
X-Forwarded-Encrypted: i=1; AFNElJ/cKlgYvUJCCqPE8OWojI2FdJcDMMjGw0MVCXJ+AmvC5gAKdABvsuAlTL+WqlvZOcDFo6RPEvipEfc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxwMyMrRyoQngOUaC1YCA6Kw+ZrgctQh5xM8noKAdQGG7YwmnAK
	sv54cg38HrJfC4+7E0TsdvYn8SyvI1/izSkt3BYGa0p3CZR6m7NHMShW
X-Gm-Gg: AfdE7cmTWNwfupYeyecL2F3uG7ALiAEUOkzfqfpgqztKu5SIKR9v8Esrk1JQQjh/lv6
	SLbtLmBNjGjiwbY76Bql6sPAzdPDI0BiPCGvYvuifAQQaILMQ4oyunj3ptw2KtHNLVL4/l8SxM0
	9mHVytYFb5apCGkTY45Ma82vmlr9kir/rR+o6oXY8mcp9tMCH4/5UAV1JdPO49LMp3vlzU61zGK
	oOafXiLfbx1wakqZZ5gV50N6FpqqWjrF4g2Rlgfq0qsQnkZe863EtVp/sKnYG68497LCQnnTY6e
	f9jia/TggkMqMVv2zPY63fEfy1Eti/tzGj8ihHPkdvck48g2soKqxiKvhejQmTUbYS9xrnfB/8i
	0VgDrBPQ8GBI/2WcMqmI9kMXxBrjhUTRjwj3R5zFGS/au06hT0S5erAxQWv2C+bfl9CvPj1UjAY
	DLYY2yflgK6o8UvD+99XT1
X-Received: by 2002:a05:6a00:1807:b0:842:614e:cc94 with SMTP id d2e1a72fcca58-847c07c470bmr1457464b3a.26.1782910384742;
        Wed, 01 Jul 2026 05:53:04 -0700 (PDT)
Received: from [127.0.1.1] ([120.244.9.45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03778basm3999403b3a.49.2026.07.01.05.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:53:04 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 01 Jul 2026 08:52:16 -0400
Subject: [PATCH v5 03/17] riscv: hwprobe.rst: Document EXT_ZICFISS and
 EXT_ZICFILP
MIME-Version: 1.0
Message-Id: <20260701-rva23u64-hwprobe-v2-v5-3-2c61f94a695a@gmail.com>
References: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
In-Reply-To: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Chen Wang <chen.wang@linux.dev>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Jesse Taube <jtaubepe@redhat.com>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, sophgo@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2247; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=Mj/jc48sV87uDVzvatYAwc8BfoVVAQ4Az5OASSMTFWY=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixX3mZJjpaMfwwzVXI/rvz6L/tgtcy6pWL2lXrhyT2qs
 1vW9bR3lLIwiHExyIopshw+2pK99ZVPtO9zzh8wc1iZQIYwcHEKwETCJRj+Gf5ueu5RxNO+z0s8
 M0cw7Vlw5erEXQ/m7J4Vf2HuA9Vp3xj+x/R4lX5ZzDh3gswrDceiPfqPlsr5iyi1vcx8+Ev9e2I
 6IwA=
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_135307_272420_6CCE0161 
X-CRM114-Status: GOOD (  11.93  )
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

RISCV_HWPROBE_EXT_ZICFISS and RISCV_HWPROBE_EXT_ZICFILP are defined in
the hwprobe uAPI but are not documented in
Documentation/arch/riscv/hwprobe.rst.  Add documentation for them.

Link: https://github.com/riscv/riscv-cfi/commit/302a2d45c2435940d9a63571c66bc038adc74133
Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v5: No change.
v4:
- Update the commit message.
- Cite riscv-cfi commit 302a2d45c243 (tag v1.0) instead of ff03d8485a04,
  per Andrew.
- Add a Link: tag for this citation.
v3:
- Also document RISCV_HWPROBE_EXT_ZICFILP (bit 63 of IMA_EXT_0), the
  sibling enumeration to ZICFISS (Andrew).
v2: New patch.
---
 Documentation/arch/riscv/hwprobe.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index a09a8f16bd16f..d9928641deb99 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -289,6 +289,11 @@ The following keys are defined:
     defined in the RISC-V ISA manual starting from commit f88abf1 ("Integrating
     load/store pair for RV32 with the main manual") of the riscv-isa-manual.
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICFILP`: The Zicfilp extension is supported,
+    as defined in version 1.0 of the RISC-V Control-flow Integrity (CFI)
+    extensions specification, ratified in commit 302a2d45c243
+    ("Update build-pdf.yml") of riscv-cfi.
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: Deprecated.  Returns similar values to
   :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`, but the key was
   mistakenly classified as a bitmask rather than a value.
@@ -391,3 +396,8 @@ The following keys are defined:
 * :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_1`: A bitmask containing additional
   extensions that are compatible with the
   :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`: base system behavior.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICFISS`: The Zicfiss extension is supported,
+    as defined in version 1.0 of the RISC-V Control-flow Integrity (CFI)
+    extensions specification, ratified in commit 302a2d45c243
+    ("Update build-pdf.yml") of riscv-cfi.

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
