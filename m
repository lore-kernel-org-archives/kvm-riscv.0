Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 923D8E9B36F
	for <kvm-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 13:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DCKgOe9a07GmS7VWDJeb7tc1bLCcXvXcLSK1llZPrUA=; b=1BsX3KFNfLNR8O
	DwldHRZkh7lX0nUG7BwRtxgG+N1daFk3oea5SbGpAFobT5WWmhbaX6TMKd9aMX1uyaDazIHa0OP74
	PNWCKR/pMB/Jhw3Vc9A/hfXj9Cs9FstDcSG1v7l2XR1UoF+dCGkhc5ZHevXresgncbrWwaj2HjDvX
	GgR5P6tCfGZHZOJn7DzDLW3kpdFXNYh211ahhfyjUAE4nHEy+k4oNb/aDqrPWAysduDhtux/zQnGd
	r9KeF/nSozHUWll83gh/bOJio/J6CJw036XL34ki2Y/56SWyJOME8UfKCHs9KPWcgByeJd1BZRTXy
	hFmPhxxjtjIdMj6csPGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx32S-0000000D4SM-0nqp;
	Mon, 02 Mar 2026 13:10:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx32R-0000000D4S6-2b7I
	for kvm-riscv@bombadil.infradead.org;
	Mon, 02 Mar 2026 13:10:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=M3t7J1xADn6LVhsHjUSboELrYldQwpli53K6JflTiRU=; b=AOAwAE2Cm7BehGjcwzlks20zMl
	dZ8xvrC1BwZhyG/BDoIYwhB1TGWv2hsDQfzo2gUdzozxTkFoM2/uC/s62kkLTARTKvWvvelXB/NB9
	7GBcN12umA/ZzG2rb9octauuCPf85o5dTcD4z5DkEQj0Xw4wXG8UUfo4Audy/CfAbcFnRbPhj+5Tv
	gQKdMO+t11dTAvoBmD8KZdatwJaJwIxsiIL5XnLZGfwI2c70Fs6g7/CWSKa7A7CEVMDT3fF01TPTi
	IP8tNoEL1cRpRm6dKdZFpqNXQVDYz/+sQ6tWI9d6APummJzUuWf1QZnsxqTszYVImk6mwL2c5E9MS
	D7K90dDg==;
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx32O-000000007nL-3Of1
	for kvm-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 13:10:18 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-7d4be7c4ebeso2066225a34.1
        for <kvm-riscv@lists.infradead.org>; Mon, 02 Mar 2026 05:10:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772457014; cv=none;
        d=google.com; s=arc-20240605;
        b=Sk90vqLxREmXrpm3SmnwZm7FuSeBTzBZfZbA70JRPyTElau+39rxvJamkUqKwmOnI7
         UpsDA9KL0a7pSMWJT66D0bh4A1ILqxSEt9cIHJiWU0IvBesAqBsJV1sTuBE5EeOTRlEd
         UMm93KSuFCTUnKmr1KxG5EJ0JN95L8VZt4JLzpwIgm4u9LcFy9AUMapZbfef8HrTv75D
         z+z/gSAxBwknW+Cl4PIuxYoge8Kz1YlAhQ7bee1bSsKOiP6jktEAzMXM6n8LFXysf1Js
         iNeQ1Fz9f8eoh3OXi/7T9z+l7DttGhwTkrI6rzTX8MqkY1Esn+7wTVvcZOJzgzVA3Unk
         FZRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M3t7J1xADn6LVhsHjUSboELrYldQwpli53K6JflTiRU=;
        fh=F0QgsrI65wKRdtQfQK1r4/upjljN7YYZPg224eFdaLU=;
        b=SnJB98lZk6KFl8n7wnRoLyjP8v0ZmSTi7F8FpbHm6+2i5u/6g58Mxp+ZLVkhHprwhI
         Ofc0sw4l/nCLEeAk4aAhnEhfvdN+/VKzlrFNRRm5yVGruCdlCIdQQ/cZfGtCfQmjFl1+
         nKYlESV5Yl5uMPs9hSl4UYor+MXJwC0Y5SOR//7YqpOzgW3L7ppG/YDpwB6HCTrqGMQD
         sO7GoSkniI0uYOSOPy5Wqt9pjDhR7wzmEfDGO/nccWztiOowln9fUCPWgV48ZnA5qY3f
         1n6+64AVyHwKdbetQd0u/jJZacxJlHf0lmw1QwmPITuLmmGd13lx1r7uhc/Gkcc/WyRB
         Lr+g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1772457014; x=1773061814; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M3t7J1xADn6LVhsHjUSboELrYldQwpli53K6JflTiRU=;
        b=X+GPb+U203k4sEHEmWS/YQCkk1BFxo9c83M26E6HJFmEpi44eIN2WATiO7YgRQ0+IR
         zpszoToA4ooWwLGRmAToY4jQzY4gBnUiBs3I7GmjltLAKK6KTISsQzM5EelJKXr2IA6o
         sIHh+CNb0XNERM+s14abOk0BHEbiWhMKqw0yML0/AATf/GHjShfkcpBKs091Qk/TR3sT
         zeq+KVpxQqACaGfSr/1+AxL2NarhtFyrhAz26+XlUQQC7uhyTpjRXDhJlSrAfBmY9PXf
         eJJJCihDQhSmQSIYd4kDndCo4ZNlrb7yp0Ye57AE7CcbZdui1M+sbQx70h0KfBU1hyic
         LPRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772457014; x=1773061814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M3t7J1xADn6LVhsHjUSboELrYldQwpli53K6JflTiRU=;
        b=HFRDYvEqPPHcdi2oZMlJzBUuXxqLolEGmesTShSPDg80h3E7hBpdHzPTpjE4ZXxMqj
         l0oiogFqfRJEKVepsKZntVhR8VY8gck1hH6lQ8D2fm9iCPw3fByuHvw48aa/ZmbS0UCQ
         oEb1rmHr6OAtJOCnvPos7jpaiDRzonR0vl7Bs+AUOXPQ4ZMn+m7og/VzbSQx2DDi+OFo
         s0Nuj2lpd1q7stNIWeuV8ex/yq0A82IHipGddMHeTYMs2GWXsq2KbE+L4guW5/gV7ulO
         EuROd5B2qf+H1xhHyNAljIBviWv8ZuwC56n2EzNhVcauD2kkdxzC//maCMdSpI23VFdl
         2tMA==
X-Gm-Message-State: AOJu0YxLWKpljhe6XpSE2k3IjpCaKXmTbofS6jc7tDn5C0/KAlJhFFi6
	nxafQmOM5ybFgui5cgNANXQZOpPvgZTgkv96IKDOdRktywGZj+5X+Rkz2GRBmrg+RzmJlM8mDQ4
	NegffInQXBXzyxo1h+GMaLKq7uLKjcqblifPM4Yibmw==
X-Gm-Gg: ATEYQzxus5Cl+as1v15wEU8eQMbzFnqobl0CgW45umKGfh7EnJJxfdz8KobEEGkpIfu
	BpRAerB+iw5bhBBnkf4tDvro0ndWWAX2Yl7Wqn5NDdKiv7E13Kxls/RUrpKWhVcLT7ECcb2ynts
	2FBYcApjlxweLfwhqa6u8gOe4Cv/5OpefStLsPGqMpB4WXKGNVo82ac1lXxdj306CZ1bQbwLfhK
	OhY9rjOBB0McCprULXCrl+hC8VU0Qx00/ayjkJqxgrD4EuQzvR5YF6ob87or0MwKadJHsJn842j
	0B7L4FSrrh7ZSwq9uiXuFt+JP5qJtoZ+1W7E/IYEutPcT6J6nRDB0OiceFhye9IqDPfj939eky8
	jT56+S9qvbERyux35SMYwQAWaaA==
X-Received: by 2002:a05:6820:8c1:b0:66f:280d:56b0 with SMTP id
 006d021491bc7-679fae14ee6mr6760772eaf.16.1772457013949; Mon, 02 Mar 2026
 05:10:13 -0800 (PST)
MIME-Version: 1.0
References: <20260227134617.23378-1-radim.krcmar@oss.qualcomm.com>
In-Reply-To: <20260227134617.23378-1-radim.krcmar@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 2 Mar 2026 18:40:02 +0530
X-Gm-Features: AaiRm53jXd9YVl6VuWiDg3obNBJDRJ9uNjSZTeCJ9xO4OconUTj78RYwM-DvnGI
Message-ID: <CAAhSdy34OW-3n6z0BdWNShwYzwkmpr5L6MOXEypmCMqUOBu4zg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: fix off-by-one array access in SBI PMU
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>
Cc: kvm-riscv@lists.infradead.org, Lukas Gerlach <lukas.gerlach@cispa.de>, 
	Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_131016_926581_3A3996E2 
X-CRM114-Status: GOOD (  17.33  )
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

T24gRnJpLCBGZWIgMjcsIDIwMjYgYXQgNzoyMOKAr1BNIFJhZGltIEtyxI1tw6HFmQo8cmFkaW0u
a3JjbWFyQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gVGhlIGluZGV4ZWQgYXJyYXkgb25s
eSBoYXMgUklTQ1ZfS1ZNX01BWF9DT1VOVEVSUyBlbGVtZW50cy4KPiBUaGUgb3V0LW9mLWJvdW5k
IGFjY2VzcyBjb3VsZCBoYXZlIGJlZW4gcGVyZm9ybWVkIGJ5IGEgZ3Vlc3QsIGJ1dCBpdAo+IGNv
dWxkIG9ubHkgYWNjZXNzIGFub3RoZXIgZ3Vlc3QgYWNjZXNzaWJsZSBkYXRhLgo+Cj4gRml4ZXM6
IDhmMDE1M2VjZDNiZiAoIlJJU0MtVjogS1ZNOiBBZGQgc2tlbGV0b24gc3VwcG9ydCBmb3IgcGVy
ZiIpCj4gU2lnbmVkLW9mZi1ieTogUmFkaW0gS3LEjW3DocWZIDxyYWRpbS5rcmNtYXJAb3NzLnF1
YWxjb21tLmNvbT4KClRoYW5rcyBmb3IgY2F0Y2hpbmcuCgpSZXZpZXdlZC1ieTogQW51cCBQYXRl
bCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClF1ZXVlZCB0aGlzIHBhdGNoIGFzIGZpeGVzIGZvciBM
aW51eC03LjAtcmNYLgoKVGhhbmtzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1
X3BtdS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5jIGIvYXJjaC9y
aXNjdi9rdm0vdmNwdV9wbXUuYwo+IGluZGV4IDRkOGQ1ZTlhYTUzZC4uYWVjNmIyOTM5NjhiIDEw
MDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMKPiArKysgYi9hcmNoL3Jpc2N2
L2t2bS92Y3B1X3BtdS5jCj4gQEAgLTUyMCw3ICs1MjAsNyBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVf
cG11X2N0cl9pbmZvKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5zaWduZWQgbG9uZyBjaWR4LAo+
ICB7Cj4gICAgICAgICBzdHJ1Y3Qga3ZtX3BtdSAqa3ZwbXUgPSB2Y3B1X3RvX3BtdSh2Y3B1KTsK
Pgo+IC0gICAgICAgaWYgKGNpZHggPiBSSVNDVl9LVk1fTUFYX0NPVU5URVJTIHx8IGNpZHggPT0g
MSkgewo+ICsgICAgICAgaWYgKGNpZHggPj0gUklTQ1ZfS1ZNX01BWF9DT1VOVEVSUyB8fCBjaWR4
ID09IDEpIHsKPiAgICAgICAgICAgICAgICAgcmV0ZGF0YS0+ZXJyX3ZhbCA9IFNCSV9FUlJfSU5W
QUxJRF9QQVJBTTsKPiAgICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gICAgICAgICB9Cj4gLS0K
PiAyLjUxLjIKPgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9r
dm0tcmlzY3YK
