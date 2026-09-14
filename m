Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87208C88E50
	for <kvm-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 05:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JFqtF4k3VJAuWzjH8W3K+LVyE2Yq1o0YCZl2UNHzRDw=; b=lAAO0nvaGWQE5P
	ypfwiwTEelzVQ/OdI8KSw2x+gBe5ZNv/3cCpKBA3rdwM6RAbkWCJQLpQ/HAURgF+VO2qAUA4umbGm
	pFbatQZLqhC9qgUDlPWvj/ud68SEKg2cBe51M4dihKwo4+Fg2tufkin9QQ/zMTNzxs0sZkDGKxIp1
	AdS92aAzW1UGql+fkDkXW/tW5JtzJIUQJhJxBsr8eRc9UwCGmTBmxmXAGbMylES8dn93I+CTP17dH
	myg/tDTMd8TjX2RTL1Fp03CqUzSjkaDQy/9YYxB+5+TJ0gk6lFLwUaZuzZoHJ6N6GiwJdg5ex2qin
	KJnq0wH2G/Wv/wVty40Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5ysV-00000002LnC-432b;
	Mon, 14 Sep 2026 05:05:15 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5ysT-00000002LmG-0rTF
	for kvm-riscv@lists.infradead.org;
	Mon, 14 Sep 2026 05:05:14 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4843c3ea1f6so590743f8f.0
        for <kvm-riscv@lists.infradead.org>; Sun, 13 Sep 2026 22:05:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789362311; cv=none;
        d=google.com; s=arc-20260327;
        b=gEv5Vr953ILlvDCK8T1LJ3VDH3OtDOji8Y3Qyu9CpbJYWcZD6e5FSimK3UvDZeq+iU
         Ac9SKcs04lTExUYQkwZijHMZ8EWd4l612hVESaBV9miRrllRvmrCZEtP7YXk6p4nyv59
         qNMYQROURlw+mohN0aVT44MCDfsCzzY1MnCtjzUY/l10tKPBsxrDUc4fg+9gmR9WoxW1
         ZOgQlUtjF81GzSsSGpSVgLk6ew5vgweXc8Yuk8IMsJo2skqjsbbjvMGky3uMVcRv6IW+
         JHiSxFXqfwgXsomajO+DNEaJJIBzZGsDJTsH+9H3iGNCY0QXlrPgbhPW2DJidtWEGlzF
         3R/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2lFbqmyGf2+vEHGBSIgu/0dJXwPUBsUwy+yR+CvMM8g=;
        fh=v0D3oCE4xBJAej/bIkucvE29/8Wh+dPrmb4eQvXbn6w=;
        b=SyHN5IMujQA/9CIdx+ZjdD219emiD7g4MuTGOzA/SA9/XVOKd9KW2n0ZFLYcGlV39u
         RPlsdjdor/tJZU/4atwmzAvKsBdFxMzWT1MXHmJ/CsFnIi5EsUQoIKoF0ijPkIZYmJY8
         tlYyP8qwAg7pFwvMbx3ZCLokqSQv1tfUb5BeRg7jTm1jth6rhNVOYUFC3w4kWk7V8QB4
         6BeUEcMFFZV0q2dcP818YiuQzupymCllwPM+IQR/fUoqQ1ukBgmLLUmKheSNiNp8FkEA
         M13Tb/4EiwcdrPlPpa08knEsUNsn4bQxno/r/+sTVca63jKxbR/DswthGoKfblx5JGj5
         Axaw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1789362311; x=1789967111; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2lFbqmyGf2+vEHGBSIgu/0dJXwPUBsUwy+yR+CvMM8g=;
        b=vox8zsHAyaqA9qJl3E7edDOI5Q3EOo8SkCrORtChu1mek5dyeSqwuPh5f3iATaEXv6
         awnbzD5jh1nExLEOcAGfDq1kvArZc7/fyPcgz/Fp1htIFq5kTuHmaPbz30EPuOUf0V9J
         DzjPF9r/upeEBUdw9mV+oyEoKQN/Z4r3gamRMW4Z/MZLcrI3z/+iIPSTdLpMsG/LiBfm
         k7/+bQJN5tPVINjgPtzhLV64Fd7XiWCcgStg527FUDGkS3f6iM1xtWc7rqZY4OQ25kto
         9h27ARYxc1VOi8AP17r26SzstaDJ1GctHQHPs23Bwr1NRbUScPz1sWAMjANLtnR5Cf1t
         CX+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789362311; x=1789967111;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2lFbqmyGf2+vEHGBSIgu/0dJXwPUBsUwy+yR+CvMM8g=;
        b=GkLb/lLsqX0WiDS4SRDRuBx4XE1NW/yS0LKNVxFs1VWfwYLPyeqoDslQjXdUdl4tBa
         P0J62AnxGMcHj9WHGQzopRHwV8Tbw8lfnpNGrB/6M1s4BuRts9nQtseeAOoabkEko8Ir
         FZQCNPzMBEJ+/PRBRqTqXGi7jqt0y7XQZKZHwJq4NpvIX0onzosqSDYUUZn/cV84X9Mr
         wokLgzwyTCZheGd+pd6em2bQ6RxPSu416N+ct+Qy1HwJsz5lS3XUay6P0rWyHZHkcZbQ
         Rd/PcmQ4sZnOdyDXdJ2v6EP53VocQ1l6a7QsBjkWgt9+ACDcaYl9Hapy0AG4CWUXAOzD
         /Pew==
X-Forwarded-Encrypted: i=1; AKwUvByq2RTnGVQC0z0NgB7fxzJBQ8b7BnddhSDyRzjStyIBpXd1UfMMZ5dMVjnN/MothBCR/Rq/XronCrM=@lists.infradead.org
X-Gm-Message-State: AFuF++nuF9waRTRZ6/1zeoSbwg1yIN63gOPGrbXblq5WBOgZR5nNdgXO
	E8WpwtP/QOMpcbYZNNRaxeVakppyzcEh3lJ5mNB4VFYr6hlWPZXPdQCnIGhDMPB6f1gRfYFXuwp
	ggfI01SvbG09Ot9y+OzS930Ip17ZyP7C+uJQt1OttVg==
X-Gm-Gg: AYBFou05rViyr6QcV3t0iYl3LDpJjaEAhPgqunYjlDYWPczVyxeqwXLKUUz+PrFW2Bg
	GtIGfbmbBxH+LwKZEHEXWGDo9RfEWUhUmj5W2skQhBbA611JrrjQ5/B9j+uIwYNkXxnGPhS3Nav
	40zn86vYxwS+KDH8UXrgE1/LNzbDEmzTT+7JYEAPe6F928UWPV+g9ZRrtkxi+kciqACAPbiZl8K
	BUAb8C/cDez5+sX5H4uykhAQT9B7ozbRuv4KT0bY9e5uogjL9OAu2Ze/OgI8V8EfNV2qrT7LS3E
	EwPt7+TxXOTLi1fI5bJecLcZJjaZwWwJTsBlHrlfSWXuQjDrOdhLIjz6dYvTDFPEA3E1SNlgeSK
	NIKNCNNzqrK+3Gbr1NXTD8N37v2ZtNb91CgeeP7hNGkhXPRmuH4yBustSjgpJVYh45j+zv1XjMw
	==
X-Received: by 2002:a05:6000:2891:b0:487:212:a412 with SMTP id
 ffacd0b85a97d-48702ae4de6mr759634f8f.9.1789362311187; Sun, 13 Sep 2026
 22:05:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260825083719.643970-1-suunj1331@gmail.com>
In-Reply-To: <20260825083719.643970-1-suunj1331@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 14 Sep 2026 10:34:59 +0530
X-Gm-Features: AcwNN1UE_9mObcL_0yUCsop8W1hIdGl2EPgpfLQFtwqx2oRTCfP20KwRbzdJA5Y
Message-ID: <CAAhSdy33LqjYrozd0X7c6kLGz=bHgOuPAk+r6Je2R9a5Nh_-VA@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] RISC-V: KVM: Fix PMU counter handling issues
To: SeungJu Cheon <suunj1331@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-kernel-mentees@lists.linux.dev, me@brighamcampbell.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_220513_270182_BC298B20 
X-CRM114-Status: GOOD (  11.77  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBBdWcgMjUsIDIwMjYgYXQgMjowN+KAr1BNIFNldW5nSnUgQ2hlb24gPHN1dW5qMTMz
MUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gVGhpcyBzZXJpZXMgZml4ZXMgdGhyZWUgaXNzdWVzIGlu
IHRoZSBLVk0gUklTQy1WIFBNVSBpbXBsZW1lbnRhdGlvbjoKPgo+IC0gcHJlc2VydmUgZmlybXdh
cmUgY291bnRlciB2YWx1ZXMgYWNyb3NzIHN0b3Avc3RhcnQ7Cj4gLSByZXBvcnQgZmFpbHVyZXMg
d2hlbiB3cml0aW5nIHNuYXBzaG90IGRhdGEgdG8gZ3Vlc3QgbWVtb3J5OyBhbmQKPiAtIGZpeCBw
ZXJmLWJhY2tlZCBjb3VudGVyIGFjY291bnRpbmcgYWNyb3NzIHJlYWQgYW5kIHN0b3AuCj4KPiBU
aGUgY2hhbmdlcyB3ZXJlIHRlc3RlZCB3aXRoIHRoZSBleGlzdGluZyBLVk0gUklTQy1WIFNCSSBQ
TVUgc2VsZnRlc3RzCj4gYW5kIGFkZGl0aW9uYWwgdGVzdHMgY292ZXJpbmcgdGhlIGFmZmVjdGVk
IHN0b3Avc3RhcnQsIHNuYXBzaG90IGZhaWx1cmUsCj4gYW5kIHJlcGVhdGVkIHJlYWQgcGF0aHMu
Cj4KPiBTZXVuZ0p1IENoZW9uICgzKToKPiAgIFJJU0MtVjogS1ZNOiBQcmVzZXJ2ZSBmaXJtd2Fy
ZSBjb3VudGVyIHZhbHVlIGFjcm9zcyBzdG9wL3N0YXJ0Cj4gICBSSVNDLVY6IEtWTTogUmVwb3J0
IHNuYXBzaG90IHdyaXRlIGZhaWx1cmUgdG8gdGhlIGd1ZXN0Cj4gICBSSVNDLVY6IEtWTTogRml4
IHBlcmYtYmFja2VkIGNvdW50ZXIgYWNjb3VudGluZyBhY3Jvc3Mgc3RvcCBhbmQgcmVhZAo+Cj4g
IGFyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMgfCAzMyArKysrKysrKysrKysrKysrKy0tLS0tLS0t
LS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9u
cygtKQo+Cj4KPiBiYXNlLWNvbW1pdDogMGEwZDFkNTVkYWQ1NzA3MjRiZjhjN2VhODM0MDk2Mzlj
ZmI0YmU5Ygo+IC0tCj4gMi41Mi4wCj4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8
YW51cEBicmFpbmZhdWx0Lm9yZz4KClF1ZXVlZCB0aGVzZSBwYXRjaGVzIGFzIGZpeGVzIGZvciBM
aW51eC03LjMtcmNYCgpUaGFua3MsCkFudXAKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2
bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
