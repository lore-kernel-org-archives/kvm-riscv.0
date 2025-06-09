Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24938C61CE8
	for <kvm-riscv@archiver.kernel.org>; Mon,  9 Jun 2025 23:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Z7EQd6T3P2qksCEhCoiQu3qIugyyqsAmIut9N0JFAyo=; b=4s53+4BT37CuiKYDMYuwdah1Nq
	chp7Cok2KVYPZ5YI8Th1bcza7v0BKvYBcHIBE1mEFi7pHsYBYaoMrOmIP7clOTtRGfb3185MQFeOe
	9DELsrfJu6/JjbZ53VSMimC/4naVdEkKUw8ht/TsZRlUaAmEOod9Anz5WFUU7xFtQ2TzdowvIpa/D
	zLqE3hsSCPhdc03xT8IxJSQNl9R/8zQjMsJ+DVz7V5WXAj9vLhrcJnZDmEOuM4pnnLJenxMyhvqHp
	biKRyBXi0maMvfdV03p9x3hT/XqipfL9osIL9dXtnk146wYmyAcb2nNNwXtLu9WEeLyxP+3aIou8F
	c3RV697g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOlcU-00000005QC9-3AW7;
	Mon, 09 Jun 2025 23:09:34 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOlcS-00000005QBk-0dQ1
	for kvm-riscv@lists.infradead.org;
	Mon, 09 Jun 2025 23:09:33 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-32aabfd3813so39615971fa.3
        for <kvm-riscv@lists.infradead.org>; Mon, 09 Jun 2025 16:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1749510570; x=1750115370; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m7W8szO//zDzhBhYgLCrpR6jY+WOXvSIWny+9NgxWUk=;
        b=pVZSe9L3YuH9Ua2J22a4Xlyj3DoFLcgmSfBlU9Eofvz2bcUhyNYQC1sk1OUXSuysmU
         CY1Y89P6DHzVTIbt0wYPzkN3zOa0SL3IsLi8vqh0v4JxMjHZfvoq7Dz6yVmmZ+z+suVW
         /5tZHgSvR+EXViw5xsFtBT+GcPky9DI6CROpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749510570; x=1750115370;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m7W8szO//zDzhBhYgLCrpR6jY+WOXvSIWny+9NgxWUk=;
        b=Q/i7i8/VoWqR1Hd9vuC7bCKoZS9Jd/SK4WFTcK5rnvd4gSW4bcNyx+fS9tMEA39n09
         uLlx36Kb/SwN8w//50H+QvD4Qb20q+kPGp4f7SbdgE7tSMuC6gtaNc0G2gyOrGTnMkmN
         pI6V+lsTg7aKt/AlD51u3pIBoYWNn9ERZRePMLhuT+suJwlEFfrNNxXp9CqayclnoN9O
         5NV01xVmHuvHdFpkRENYzV2ED5r7GaMx9AD8boxiwLMHmjRswScyS9oM0AzVbgcFwcEl
         mRFF+bbiILRHOdub8xC4h9sv9q1040LTMYAMKABC3Ww6fYpdvSV4kV++9VjooTy4bZ5M
         WAKw==
X-Forwarded-Encrypted: i=1; AJvYcCVxf/gWFOTn1l4urp6884xxFmFQU3RybFZRi3hRNZkkgQ4u00suhfxuqvLJ+VVMSnBuarNj2O+WUQI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzmTRb4N5NxnMvFZIApzTyL+ISmWjLfo2Ea2n8AXvDuFM0y8Kxa
	QYhfpvdpGep7gHUj7VOf5hNy75xn/sImB7THgSjg65DTMrOmBcEpXPuOI4D4Mak8FGJfjKAmvO3
	T+PYo4p2MmoBWikK9hWxoU8QMEZ6+BK6ZHusZYice
X-Gm-Gg: ASbGncuVqvkvEnlngkvZLs03ybRTWz8bC7NEzBbneBrOteMmpCXHrV5LlMXCjAFqGNm
	HCuWQi6w7t0ZVykSA3Ncp1Sbj8kxIPeWXR+pj/UNgVN65uReUwANzRWVDeEdPSfWrBaD95wRxmT
	fhe7v/V0AP4tjV3C72LF6S+wzWkRCmzPGjTymsAMqE
X-Google-Smtp-Source: AGHT+IEWMMff+VYQVsGpjnaXm/Rn+Jul0YvV4ACZEai3Uq0Vho3uDx8M4RM6ygBBdbc10Ja/CaIYRVTgzwggqMG9dMg=
X-Received: by 2002:a2e:8645:0:b0:32a:6c16:d3a5 with SMTP id
 38308e7fff4ca-32adfd369bcmr31191401fa.3.1749510569768; Mon, 09 Jun 2025
 16:09:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAOnJCUJz6p6b0WK_7=qowe8_pCHnv5WJXNYMa-uzFy0PHc7Dvg@mail.gmail.com>
In-Reply-To: <CAOnJCUJz6p6b0WK_7=qowe8_pCHnv5WJXNYMa-uzFy0PHc7Dvg@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 9 Jun 2025 16:09:18 -0700
X-Gm-Features: AX0GCFvzzx0sgQlTBgQqz1aYTf9FCOEcA5zF6GsJeLGQOky_JUzsDZRXZjmq3RA
Message-ID: <CAOnJCUJ-VusA8E4-ABvXPZOReD3nq6_jvqNF5bscfDY89_BoRw@mail.gmail.com>
Subject: Re: Public Review : RISC-V Supervisor Binary Interface (SBI) version v3.0
To: OpenSBI <opensbi@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, isa-dev@groups.riscv.org, 
	"open list:RISC-V" <qemu-riscv@nongnu.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_160932_331488_E9AF65B2 
X-CRM114-Status: GOOD (  13.86  )
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

SGkgQWxsLApUaGUgcmV2aWV3IHBlcmlvZCBpcyBub3cgb2ZmaWNpYWxseSBjbG9zZWQuIFdlIGFw
cHJlY2lhdGUgeW91cgpwYXJ0aWNpcGF0aW9uIGluIHRoZSByZXZpZXcgcHJvY2Vzcy4KClJlZ2Fy
ZHMsCkF0aXNoCk9uIGJlaGFsZiBvZiBQUlMgVEcKCk9uIEZyaSwgTWF5IDksIDIwMjUgYXQgNToy
N+KAr1BNIEF0aXNoIFBhdHJhIDxhdGlzaHBAYXRpc2hwYXRyYS5vcmc+IHdyb3RlOgo+Cj4gV2Ug
YXJlIGV4Y2l0ZWQgdG8gYW5ub3VuY2UgdGhlIHB1YmxpYyByZXZpZXcgb2YgdGhlIFJJU0MtViBT
dXBlcnZpc29yCj4gQmluYXJ5IEludGVyZmFjZSAoU0JJKSB2ZXJzaW9uIDMuMC4gVGhpcyAzMC1k
YXkgcmV2aWV3IHBlcmlvZCBiZWdpbnMKPiB0b2RheSwgOSBNYXkgMjAyNSwgYW5kIGNvbmNsdWRl
cyBvbiA4IEp1bmUgMjAyNS4KPgo+IFNwZWNpZmljYXRpb24gRGV0YWlsczoKPgo+IERvd25sb2Fk
YWJsZSBQREYgVmVyc2lvbjoKPiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Ytbm9uLWlzYS9yaXNj
di1zYmktZG9jL3JlbGVhc2VzL2Rvd25sb2FkL3YzLjAtcmM3L3Jpc2N2LXNiaS5wZGYKPiBTb3Vy
Y2UgQ29kZTogaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2LW5vbi1pc2EvcmlzY3Ytc2JpLWRvYwo+
Cj4gSG93IHRvIEdpdmUgRmVlZGJhY2s6Cj4gRW1haWwgeW91ciBjb21tZW50cyB0byBvbmUgb2Yg
dGhlIGZvbGxvd2luZyBtYWlsaW5nIGxpc3RzOgo+Cj4gcHVibGljIGlzYS1kZXYgbWFpbGluZyBs
aXN0KGlzYS1kZXZAZ3JvdXBzLnJpc2N2Lm9yZykKPiBQUlMgbWFpbGluZyBsaXN0ICh0ZWNoLXBy
c0BsaXN0cy5yaXNjdi5vcmcpLgo+IE9wZW4gYW4gSXNzdWUgb3IgUHVsbCBSZXF1ZXN0IHRvIFNC
SSBHaXRIdWIgcmVwb3NpdG9yeS4KPgo+IFJldmlldyBhbmQgUmF0aWZpY2F0aW9uIFByb2Nlc3M6
Cj4KPiBEdXJpbmcgdGhlIHJldmlldyBwZXJpb2QsIHdlIHdpbGwgY29sbGVjdCBhbGwgZmVlZGJh
Y2sgKGNvbW1lbnRzLAo+IGNvcnJlY3Rpb25zLCBhbmQgc3VnZ2VzdGlvbnMpIGZvciBjb25zaWRl
cmF0aW9uIGJ5IHRoZSBQbGF0Zm9ybQo+IFJ1bnRpbWUgU2VydmljZXMgVGFzayBHcm91cCAoUFJT
IFRHKS4gTWlub3IgY29ycmVjdGlvbnMgYW5kCj4gbm9uLWNvbnRyb3ZlcnNpYWwgY2hhbmdlcyB3
aWxsIGJlIGluY29ycG9yYXRlZCBpbnRvIHRoZSBzcGVjaWZpY2F0aW9uCj4gZGlyZWN0bHkuIEFu
eSB1bnJlc29sdmVkIGlzc3VlcyBvciBwcm9wb3NlZCBtb2RpZmljYXRpb25zIHdpbGwgYmUKPiBk
ZXRhaWxlZCBpbiB0aGUgcHVibGljIHJldmlldyBzdW1tYXJ5IHJlcG9ydC4gQXNzdW1pbmcgbm8g
aXNzdWVzCj4gbmVjZXNzaXRhdGUgaW5jb21wYXRpYmxlIGNoYW5nZXMgdG8gdGhlIHNwZWNpZmlj
YXRpb24gdW5kZXIgcmV2aWV3LAo+IHRoZSBQUlMgVEcgd2lsbCBwcm9wb3NlIHRoYXQgdGhlIHVw
ZGF0ZWQgc3BlY2lmaWNhdGlvbnMgYmUgcmF0aWZpZWQgYnkKPiBib3RoIHRoZSBSSVNDLVYgVGVj
aG5pY2FsIFN0ZWVyaW5nIENvbW1pdHRlZSBhbmQgdGhlIFJJU0MtViBCb2FyZCBvZgo+IERpcmVj
dG9ycy4KPgo+IFdlIGV4dGVuZCBvdXIgZ3JhdGl0dWRlIHRvIGFsbCBjb250cmlidXRvcnMgZm9y
IHRoZWlyIGRlZGljYXRlZCBlZmZvcnRzLgo+Cj4gQ29udGFjdCwKPiBUYXNrIEdyb3VwOiBodHRw
czovL2xpc3RzLnJpc2N2Lm9yZy9nL3RlY2gtcHJzCj4gVGFzayBHcm91cCBDaGFpcjogQXRpc2gg
UGF0cmEgKGF0aXNocEByaXZvc2luYy5jb20pCj4gVGFzayBHcm91cCBWaWNlLWNoYWlyOiBTdW5p
bCBWIEwgKHN1bmlsdmxAdmVudGFuYW1pY3JvLmNvbSkKPgo+Cj4gUmVnYXJkcywKPiBBdGlzaAo+
IE9uIGJlaGFsZiBvZiBQUlMgVEcKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8va3ZtLXJpc2N2Cg==
