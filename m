Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E371E10ED676
	for <kvm-riscv@archiver.kernel.org>; Fri, 27 Mar 2026 13:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=coVZHx3lSkchLMfcU7v+u9hmZBxC3ojviABmJGi+AzQ=; b=pRUnHLvaKEd+1A
	IAmcsWIpjwkL4JgcIFs9hjeO4IDO5Yrlb5jUvW0pjWF7wtFOBH+Y2f8l9hkz92niJIfB4NTeXxIz6
	FLy3QQGOoKHUeiilHthEIP9P8PYOHGRgPqabEIL6AFCtBtNZ75H23fd3Uey9FBGrhUtzHNU1xObIN
	qZbDl6a64PBgsfUM6Gbn26RTGWkabc5JDMq0lrvxNXsYkTCgt1XFK/+0LwStpdqVrQg5ZvlEPeq7T
	917x3kluiDzqrWBSeneuST7NV9iOOrhZBxsQU4R/+zSI4UkGQmIfh73t0lf5HwE3e/Dr53SpXna/H
	kVjq6/YCyqZShD8rwt0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w66vW-00000007OaR-2Vz5;
	Fri, 27 Mar 2026 13:08:38 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w66vT-00000007OZj-1x0u
	for kvm-riscv@lists.infradead.org;
	Fri, 27 Mar 2026 13:08:36 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-46704177543so1409520b6e.2
        for <kvm-riscv@lists.infradead.org>; Fri, 27 Mar 2026 06:08:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774616914; cv=none;
        d=google.com; s=arc-20240605;
        b=jeqDHAuGcNnpZD11cel++xJ3NoEw5OFmJG8NVzLK7wX1IgK/lhWtz4m3/8VBpN4Em7
         p5Q6v/Yf1XtQSrncva1qSNPMl135Md/ftasfu3ht6/8EBWlxH+mSnEBtOB2h4uD6y/o7
         rQupaszKybrPFsOSvFmsqDJME2gWH8P9IIAcjpoSIbRfXdiqpfOu2maHiqfIr5H/Oi7c
         5jkrX0PAMKcKaIeX++V6p3jhArmk4zfyvd+Swd9sDxzKXLisJJXosOubXpSGrkEaZaMo
         o7V7u4MZnss0lhsuaVXZBGHRnqKZqn3U1SHIwc7UGTyoG1dp5P1l3n/0MQZfnS2tHa9j
         +keA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kmbMPpAvEXl89b9DDmueCespLqdFhwnm0SegHcujUGk=;
        fh=QtsiLW7lQYEQ67fvECL7FsShzmfGIJPG55Yci7nNpjg=;
        b=cMS7f1ZE0wI7p9+FIOlF30a6o5vKeVq5hnRc6N9S2aVTXQNHVVq7UjahvfnVHq7DJj
         O+eAMXU/oi0bmzsDP6SF8VYZpDToDKwROqxFlfLCy0zGLEwm4vZuhp4qZAHICpVeI+zW
         BFawOG+gNKbLq8C/VZSRX1TLwQp1+WPWvfc8vy7Gm4GseEDkWVQ0ZBxCyMMTp2HmAD3u
         j6oX0XUhRPxVNe57XC1Ah+TUB+AOHGEQb/Qiew0fWGS0cKAE0YUGm79WPlknzAAKmdga
         Rb1S19f28MLHio0P3PfFUexobl6pVqOaiixPJyhQ+dc90fqVSzTwnvs8kzevkN7VqE4k
         8qDA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1774616914; x=1775221714; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kmbMPpAvEXl89b9DDmueCespLqdFhwnm0SegHcujUGk=;
        b=TNjvg1iGK8bht+e0aibEMzDfJl+8EPpoccop9bjC/Ln/wWJ/T5gH0cLq+IvPmj+4Zc
         +KlQOIc78MKidyTs/Q7dMbpqH2G1ucBJSwwKSkaUNG18sR8qVRVyrI1cokdG6DUghJpv
         hcc3V1DAE/EvSMO7T7z+cWMBVsMwgZRPM0ElHhoODh3ZBIOjpG1x7kFEFg9jopi4ZgI9
         iw0+nUb/3xbqXbLfKBjHHB9BbxrXEg5c+g4FLheARfQ/1HLBs4hshcX0p4/1jIoOWwaL
         QAJn5aYHIkew3zhQGQaCaOt7gUsv+W9xnVHHTG33HWmNvTtIk6HdQEPd4w7X9yvZ7N+E
         DG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774616914; x=1775221714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kmbMPpAvEXl89b9DDmueCespLqdFhwnm0SegHcujUGk=;
        b=PEYImnGoN8sQSvj159rhIyhTHTlPEs6fLzfq06WIn6xWpz5hVjwjDJybZ4KXfLrSzm
         +mA6o/Qhlg6hlVA2eRx+0hZqitOW7krGOYliB7s0JXM5F89iseSH/Wolj/kRRyj3ew2x
         /bY+SXRBPeEyuv2uTzfwJKqIezs2Ok7CtgZHKaPL/F7QIShMZmrIfLsMc+cB5dhjRi/J
         16ocAOHdBVjSJ0uXcDv0MCQQbPJm1sC1CBPyHJob76oBIwf3dnjame5GpaLrKlsExwpR
         X/XQI7jjmn7jGZIy5uYrp1RuB9Tc5rr9wRz6mSFJo5EC2gK49XXcf2ZEvIJYiCe7I9A1
         nEzw==
X-Forwarded-Encrypted: i=1; AJvYcCWSuduGlvPpsklvpZGjEfuzCBZY3pq2Ep3EyJhzS/vCGYZ1M4TsPjSQfHKyMvolf1eVJlnva4z84cc=@lists.infradead.org
X-Gm-Message-State: AOJu0YweZ7C1pkT5j2OoZ/oYjqg9Ao85pTdMX/D6V5TZteqiD5kubIam
	up2GlXHnMkDFp2OsxvD6xtm/iBPVEfrbdRzUnoaklU+6zROa4JgQJr8+faUnFjgOZ/8gtBHHhdn
	d7Np/kElOCGIXd71YTApXzEHrH7ckVatvwEc4WxdQMg==
X-Gm-Gg: ATEYQzz1DWFcAultto5hR1KvQBvgvGjJblyDOI9o1QAJtaPkhkCVM6elR7tFthnL9rE
	J7Agfdzp31EVw3VXp/UnTPKcSnAkeR+bn7z5//rrcajv8tBeLii7s9ImnKCHfh1X5lK92NgEd9U
	v+GBvYl0ErPQC4wB++4tix3WGdDaOchaDW7uSsf1V7bYwgTa7tFDs8XVINKzlDn/IfXn1FCJXzD
	aPE3uGZg8wVV5I3L0XwxcqBjjsRNLN1MPdBgsDb4boq/duV3SlJ0SF8gRkmmwlS/Z7lSmmLVO3M
	TsT0RJmD4AOlfEBzHQQ3ZnRLXlzAWO5X1HhSEmomtTHUQTjCl1wbyESzyzCcrOlApo/2QSVC1SZ
	HPT62x8ZACeDjNDD2S0SFbT7CpA==
X-Received: by 2002:a05:6808:1446:b0:467:3f4:907a with SMTP id
 5614622812f47-46a8a61bfc9mr1080873b6e.52.1774616914163; Fri, 27 Mar 2026
 06:08:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260311231833.13189-1-osama.abdelkader@gmail.com>
In-Reply-To: <20260311231833.13189-1-osama.abdelkader@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 27 Mar 2026 18:38:22 +0530
X-Gm-Features: AQROBzDaiuO8uOhM7V4GcN6kMarCQKRgIGfEl9WOxz4H4Jv6lFJN2-pYAWK-4is
Message-ID: <CAAhSdy0kGyp6APnB25v47jqNeaFj59ff15Ja-Kyj=9AXMVQSsg@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: KVM: fix PMU snapshot_set_shmem on 32-bit hosts
To: Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Andrew Jones <andrew.jones@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_060835_510092_6930C28E 
X-CRM114-Status: GOOD (  14.88  )
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

T24gVGh1LCBNYXIgMTIsIDIwMjYgYXQgNDo0OOKAr0FNIE9zYW1hIEFiZGVsa2FkZXIKPG9zYW1h
LmFiZGVsa2FkZXJAZ21haWwuY29tPiB3cm90ZToKPgo+IFdoZW4gc2FkZHJfaGlnaCAhPSAwIG9u
IFJWMzIsIHRoZSBnb3RvIG91dCB3YXMgdW5jb25kaXRpb25hbCwgY2F1c2luZwo+IHZhbGlkIDY0
LWJpdCBhZGRyZXNzZXMgdG8gYmUgcmVqZWN0ZWQuIE9ubHkgZ290byBvdXQgd2hlbiB0aGUgYWRk
cmVzcwo+IGlzIGludmFsaWQgKDY0LWJpdCBob3N0IHdpdGggc2FkZHJfaGlnaCAhPSAwKS4KPgo+
IEZpeGVzOiBjMmY0MWRkYmNkZDcgKCJSSVNDLVY6IEtWTTogSW1wbGVtZW50IFNCSSBQTVUgU25h
cHNob3QgZmVhdHVyZSIpCj4gU2lnbmVkLW9mZi1ieTogT3NhbWEgQWJkZWxrYWRlciA8b3NhbWEu
YWJkZWxrYWRlckBnbWFpbC5jb20+Cj4gUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YW5kcmV3
LmpvbmVzQG9zcy5xdWFsY29tbS5jb20+CgpRdWV1ZWQgdGhpcyBwYXRjaCBmb3IgTGludXgtNy4x
CgpUaGFua3MsCkFudXAKCj4gLS0tCj4gdjI6Cj4gLSBiYWxhbmNlIGJyYWNlcyBwcm9wZXJseQo+
IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5jIHwgNyArKysrLS0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9rdm0vdmNwdV9wbXUuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMKPiBp
bmRleCA0ZDhkNWU5YWE1M2QuLmVjMGMxNTcyNmRhOSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2
L2t2bS92Y3B1X3BtdS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9wbXUuYwo+IEBAIC00
MjMsMTEgKzQyMywxMiBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVfcG11X3NuYXBzaG90X3NldF9zaG1l
bShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVuc2lnbmVkIGxvbmcgcwo+ICAgICAgICAgc2FkZHIg
PSBzYWRkcl9sb3c7Cj4KPiAgICAgICAgIGlmIChzYWRkcl9oaWdoICE9IDApIHsKPiAtICAgICAg
ICAgICAgICAgaWYgKElTX0VOQUJMRUQoQ09ORklHXzMyQklUKSkKPiArICAgICAgICAgICAgICAg
aWYgKElTX0VOQUJMRUQoQ09ORklHXzMyQklUKSkgewo+ICAgICAgICAgICAgICAgICAgICAgICAg
IHNhZGRyIHw9ICgoZ3BhX3Qpc2FkZHJfaGlnaCA8PCAzMik7Cj4gLSAgICAgICAgICAgICAgIGVs
c2UKPiArICAgICAgICAgICAgICAgfSBlbHNlIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICBz
YmlyZXQgPSBTQklfRVJSX0lOVkFMSURfQUREUkVTUzsKPiAtICAgICAgICAgICAgICAgZ290byBv
dXQ7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4gKyAgICAgICAgICAgICAg
IH0KPiAgICAgICAgIH0KPgo+ICAgICAgICAga3ZwbXUtPnNkYXRhID0ga3phbGxvYyhzbmFwc2hv
dF9hcmVhX3NpemUsIEdGUF9BVE9NSUMpOwo+IC0tCj4gMi40My4wCj4KCi0tIAprdm0tcmlzY3Yg
bWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
