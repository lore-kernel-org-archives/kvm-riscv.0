Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F516C54F4C
	for <kvm-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 15:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zGWjx26b0nw/LlkRU6ndSL/XjcP0x/1+5KUuuNuGWTg=; b=uQGFMRVY/rmoYj
	ET72mjrdBwL1Wop28Pk0AlTjG4iKvPoag8bNyeH+8xlZJuzxQ3KRNjmQWJzATdT1aJM9Itrg6WO4X
	tCLLXjgyqi5OAmaRXvJnScXzmqufpDM8QkRrPHmsQUyNkcAruq0PTU7xcFdibBZoy/LW4wWoN1aUr
	50zIzv46XEzfyYa8ejpXIZ/2avMav6jCWTSZtUKoy2QECsxH3aPPv5aFL5wlIXC9xWznMEjOtXrX6
	C6lDjO0DiZsLtWoiG4BxId8KLxPHpUDggjdbioCwm9tAaMZ2uMU3MHlUZSSjznMPlvzUXFIUPtM5m
	KRyXc1H7Xt/FuKC4sKLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojqW-00000005fFi-1YUG;
	Tue, 28 Jul 2026 15:35:56 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojqT-00000005fEG-38Fo
	for kvm-riscv@lists.infradead.org;
	Tue, 28 Jul 2026 15:35:55 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-47f6609c657so1292f8f.2
        for <kvm-riscv@lists.infradead.org>; Tue, 28 Jul 2026 08:35:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785252951; cv=none;
        d=google.com; s=arc-20260327;
        b=QHksL0knGSCTYD4MMSrrm9yZCJVpAcarNcSyqEgTrbkoLCXtPLXBQIJU0IL3sPhtjL
         obeM2vNWzkHJS3bUAeWpX1ecTA7w9eXNnJ3galRaAFmA8ZTfTY0BYUH4SD2BI1JIwcJh
         bctNnjFlLH0ugllpCaa7AEAJhjBl1UPEP7dS4SRaxoQJrS6g/oDR9kfgFDWMYbqnjMQG
         2apnLUcKoIyCZakoEaPqzu9cS0JNfbSqsiftkrtrVojstav4pKN8jINmCJ4ytHQuoRHJ
         4F32o2AUDz8NPDUzXnbKG/RUlYGfKuVm3tAcUSy6UEmpLUO65V1wzaxKPspN06p5T9+v
         S86g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AViFMS0ewOoq1cL1NaPq6qKbymiWEx2DbacEkdjRd2Q=;
        fh=PEmWfbHqFZOid1ucwjkQJO14bxt3D0fG8fAbv0TZbLM=;
        b=BcfsyGTMjYqULPgw83uSvRV3krTRrNSPNRkdJ4p7Cg5Och4g5Gk9rNdMtbGg7quhA0
         QijZLGuLawSdSD4SlScF+UUA5/vDTFD/NfIzZ13ZZXcqOJweeMLIL+U5A4c4o6CJppRN
         J2Mt4Nywi8NVGPlmXdWopduMp0oCTWqxwAGu/fmAb5nrZYZyLLapvExHWRgFXJGw+1fX
         85BcGiz7fi6PZiN9Hztfvqrb6SU9aPBPfztJPXp3CHAThymuSIJDhX31ciD6ozw6sIxp
         Ip7B2IqnJQmAqoWfbGpxiRYlp/jZYVwDvqdMqnlPpwrbcDMYtazDdecJD7mNrRiLntbH
         9grA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1785252951; x=1785857751; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AViFMS0ewOoq1cL1NaPq6qKbymiWEx2DbacEkdjRd2Q=;
        b=BcUy+UYdoy5au8nohsBDVrW1OryjtOY6vgFDywZhwI104klMXO2xfHg2TUpClwXQ6g
         49LvFER2oXeCzqe0iuFaoFp9pQNxdsWlfOocZUlIZeZv6iGNYaguXULzEBW5ByHAMEJn
         iahXBZuxT7CX8DqaUY7slKO9JA+/SZjjVczGkToYRAvgsAvQYf3jketoWreKTOmNv8jM
         lWUOCHXEXDMxWALwN8BK8hlGe4xVcjnN4NAD/DW1FaJhdi59b4etoxuLJexyldi3wKWJ
         eY8/fA+2nB/Rz6Atgy3Rd9Od0LxUm+ABNqI/ac7IIdlF7gLwhUL7/GqhHEOcLDE2jX13
         ZtyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785252951; x=1785857751;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AViFMS0ewOoq1cL1NaPq6qKbymiWEx2DbacEkdjRd2Q=;
        b=CiuW3FJZjROE6yI+DWfSZ9lCjftFuVlvcBbogAnMy2lk+75dY3p0iiu9dgvbXX9H6P
         1Csgr/DfaUm8bkWzfvG79S4miFTgXIOoX+AOb/D9rYi53Idof3G639fp3pz1SYdgUhlp
         k6y6Syr5pQFjgpGm6x3wwQuvZRQPSzbgnthWs3usy2b/jK2zXznhlfykjQkuUUENaa/9
         n/CaqWKwq1wRpWmkKqTzJxm0aujH8eG4xRAJdhztSP4Er8w77Nd+t3wxlh1VXNsflOFT
         oJwMIFMjnhhw/TLjZpuTeZOwlWC9DSxjeNkafuUuLuUvzdsWQhH/z8wd+q66ahQ70qNl
         CXfQ==
X-Forwarded-Encrypted: i=1; AHgh+RrsUclweKttpjpjaCHZChch1nkQM/3PRiKplJ0W4NPDZc5b3U1pX3V5UQNqAXAlH6717dbbFHPTTRQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YyBs72IU5TMsSxzYBMxMV5nS6gvjmNs74N0YroECr6qweVeb0Cv
	AiJ9Taw99oT2/+aKvt3C0nq5qX63OpXcvUgtHbQoXeJtNS5UoH41aouAZIClXi+Re+mISR5EGaL
	+VOt9aNbsg9VuxM9w3M+nLVfPOcpE+O9twe33r3s7Fg==
X-Gm-Gg: AR+sD13ODTMt696K6cZlp5yjm4Sx5I3uYQNgFzQcX9MlsM/1usFbojXuwyRd91Ehwir
	y69XXlHjEdO6psKim7jmPBjHB6SlzmMIXtg6CeHxHh13BSUBlhzAFUF3/ZKyKNYqPcU0CdtO58I
	zu3djv3aJWvzMNLT+350bNN+lVBnF6W++PAdWPri5RXiYkVdTCUGQ9ijld+PhPT04qMUlZHzzLU
	Hb9X71CLk2CDH96usglR90A5f6QeeoLam+6obTIXvfyUKuol7K6Y9J1tzATeti0XQ65cCtD+Xd9
	6IyrBahaHewLa3zTgroa/60/N2Etrlzex9Hw7woGPO+B32jOgkdtzFmU5K0Oplzh3m279zrX4oN
	HOPTn
X-Received: by 2002:a05:6000:606:b0:47f:2634:b5a with SMTP id
 ffacd0b85a97d-47fb1ea7d51mr3223821f8f.33.1785252951217; Tue, 28 Jul 2026
 08:35:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260626103619.174179-1-yhchen312@gmail.com>
In-Reply-To: <20260626103619.174179-1-yhchen312@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 28 Jul 2026 21:05:39 +0530
X-Gm-Features: AUfX_mxshNrjU_4DhTQT2LcNdq_XRUYgd4f2QGjF33GZ2jYUBKW7SoamrV0OVuE
Message-ID: <CAAhSdy2Qa2DGFzb27MgmoH5Pf1BOrgwaZBqP__U9eejs5-5Bsw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Add arch-specific tracepoints
To: "Yuhang.chen" <yhchen312@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Quan Zhou <zhouquan@iscas.ac.cn>, "bingyu . xian" <shanbeenyoo@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_083553_863616_E75BB89F 
X-CRM114-Status: UNSURE (   8.54  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBKdW4gMjYsIDIwMjYgYXQgNDowN+KAr1BNIFl1aGFuZy5jaGVuIDx5aGNoZW4zMTJA
Z21haWwuY29tPiB3cm90ZToKPgo+IEFkZCBSSVNDLVYgS1ZNIHRyYWNlcG9pbnRzIGZvciBldmVu
dHMgdGhhdCBhcmUgdXNlZnVsIHdoZW4gZGVidWdnaW5nCj4gZ3Vlc3QgZXhpdHMgYW5kIGluLWtl
cm5lbCBlbXVsYXRpb24gcGF0aHMuIFRoZSBleGlzdGluZyBrdm1fZW50cnkgYW5kCj4ga3ZtX2V4
aXQgdHJhY2Vwb2ludHMgYXJlIGtlcHQsIHdpdGggdGhlIGt2bV9lbnRyeSBQQyBmb3JtYXQgZml4
ZWQgdG8gdXNlCj4gemVyby1wYWRkZWQgaGV4YWRlY2ltYWwgb3V0cHV0Lgo+Cj4gVGhlIG5ld2x5
IGFkZGVkIHRyYWNlcG9pbnRzIGNvdmVyOgo+Cj4gKiBrdm1fZ3Vlc3RfZmF1bHQgZm9yIEctc3Rh
Z2UgcGFnZSBmYXVsdHMKPiAqIGt2bV9pcnFfbGluZSBmb3IgdXNlcnNwYWNlIElSUSBpbmplY3Rp
b24KPiAqIGt2bV9tbWlvX2VtdWxhdGUgZm9yIE1NSU8gbG9hZC9zdG9yZSBlbXVsYXRpb24KPiAq
IGt2bV90aW1lcl91cGRhdGVfaXJxIGZvciBWUyB0aW1lciBpbnRlcnJ1cHQgdXBkYXRlcwo+ICog
a3ZtX3dhaXRfcmlzY3YgZm9yIHRyYXBwZWQgV0ZJL1dSUyBpbnN0cnVjdGlvbnMKPiAqIGt2bV9z
YmlfZWNhbGwgZm9yIFNCSSBlY2FsbHMKPiAqIGt2bV9jc3JfYWNjZXNzIGZvciBDU1IgZW11bGF0
aW9uCgpEcm9wIGt2bV9ndWVzdF9mYXVsdCwga3ZtX3NiaV9lY2FsbCwga3ZtX3dhaXRfcmlzY3Ys
IGFuZAprdm1fY3NyX2FjY2VzcyB0cmFjZXBvaW50cy4gSW5zdGVhZCBhZGQgY29tbW9uCmt2bV92
Y3B1X2V4aXQgdHJhY2Vwb2ludCBmb3IgYWxsIHZjcHUgZXhpdHMganVzdCBiZWZvcmUgdGhlCnN3
aXRjaCBjYXNlIGluIGt2bV9yaXNjdl92Y3B1X2V4aXQoKSBmdW5jdGlvbi4KCkRyb3AgdGhlIGt2
bV9pcnFfbGluZSBhbmQga3ZtX3RpbWVyX3VwZGF0ZV9pcnEgdHJhY2Vwb2ludHMuCkluc3RlYWQg
YWRkIGNvbW1vbiBrdm1fdmNwdV9pcnEgdHJhY2Vwb2ludCBjYWxsZWQgZnJvbQprdm1fcmlzY3Zf
dmNwdV9zZXQvdW5zZXRfaW50ZXJydXB0KCkgZnVuY3Rpb24uCgpUaGUga3ZtX21taW9fZW11bGF0
ZSB0cmFjZXBvaW50IGlzIGZpbmUuCgpSZWdhcmRzLApBbnVwCgotLSAKa3ZtLXJpc2N2IG1haWxp
bmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
