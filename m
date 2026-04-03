Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E82D73094
	for <kvm-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 12:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8OoaSCR1Y8RmxeLMcrr6/tGwDw6g4gbRHJjU/s2Nyfc=; b=iZu+oC0yg+k/Dp
	xDZwAaoETt6XN4DseIxcN4EriFzQmY+uAGgOY8iTJQbB0RZ0IluyFk9gX4QBrTrGfhFprbX/KnlP0
	yaxpclNNLbbbjmxprZgxqRNgIFuZc5S2fRGCBtNHL3fK3tz9HfviRzi80674HjMSw/40BK4dcGdnq
	JeUQbubgJ5w1SfITDWwylRnx31VzR2VdAqBhHR+81M5BnW6nnMKyd+G3anKcaQhvhoWHVrkBOtyrt
	gmCg1Kisg502TwTaA9OemdL8FIx+AiP5tNa4AsdJK0gDj1vwLeQZ2e7j6SKVEdtUfPLALsFQTErQY
	LY3Hd7EJNnz3YvW/eY2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8djO-000000020aF-0436;
	Fri, 03 Apr 2026 12:34:34 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8djK-000000020ZO-3ZIf
	for kvm-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 12:34:32 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-7d7f09aa39fso2455471a34.0
        for <kvm-riscv@lists.infradead.org>; Fri, 03 Apr 2026 05:34:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775219670; cv=none;
        d=google.com; s=arc-20240605;
        b=V2VhHofb91IvIa+PV5MbQldMTJUfWo7OV9hPXEBKDBycrrZpc4yPdKiV4R3jkR591m
         hdKg3wyKBcW1YLjuQHeuwpNsj5vSdSAEkrZvDVGkfrJIIVhpfrzWAEIn04zVaVLsTTLi
         B4zqqSzY5CuYY6//sKukU8ezd5Hah4t1OoqGTyD6Qb1Sa86Qeb7a8bjdLBscLh2ZcFtC
         VK0W29E6/otv5qmv6258qs6MXDx/cjZ3YXtAqF45HEoHTlfINNNNL7kvI8NGy6fo760B
         zCtvZ95gry3DP12Nxvkj7SRPPYKud5cv75jdRJIlETPL5l7lC19C92YAU9KDVvpbad/7
         gNLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=59kVespEKWq9NAsOL9PYjbmf7GwSpQzIo0rrK3/DBI4=;
        fh=4FSN32JbWVRRDH4dF0NUmmNoeFxlw7zrKc8Cxn3v81M=;
        b=ClQVQdLDIqJGuovBIN18H/kmlGvWF5U5OflNkdDfQW2UruAfzSY3A2TGbRfc12Zhbl
         aQnd1i8/OT9BgC3ep5vLoYT/WLBS+JcIY7wNZ5x3gDzt3G7vGLkhJdQA1n7ybJ+nteya
         ocif65eol+qa9Hg/kjiVwjb6mudjuhpfSjmKQ0Ureffsg+wjcofcOO4BNfj6r465uJJy
         ZREeMYSWTPSDMxKNQd7xW13Frp9P/rP8ccxY3I6F5e5cEvnqT5pzkAaoUig0DwBY7mI2
         WY42yzAREsrK73y4TYxBjsvM7el25tFWdPQ9UtzvrNk7uNOdxE5KP5hPha2SmhHn3YF3
         pWHw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1775219670; x=1775824470; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59kVespEKWq9NAsOL9PYjbmf7GwSpQzIo0rrK3/DBI4=;
        b=0qIkRgXAzN0BJH5cGFzKFvVHt+MxdtKOkC4TYKkLoviCupZBFGrrsYD9R+cLDaL298
         uvddwDWWjTJBU4nFWXiqTz/XTdqppTdY29veL1kgAB0IHsC7ygAdoYImNySURw0REVre
         XfKBBPZ2hMploSBrVx0R0enoBFah7skys931tX6KVg57ztE7j9tJNUWb1pI2mHPe62bs
         mfp2LPFZN+I0zkPay2IbwoSV58u2Nls6xB4cuHJ1955WN3BAFMLekZQlOLrMOthBlhUH
         R1OohCE/vsobPGHAP0rE/eCfMT/hFBh2QQzOqb0iCnLmmuKOWdnTT5d85voEvD5cHtxi
         lf8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775219670; x=1775824470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=59kVespEKWq9NAsOL9PYjbmf7GwSpQzIo0rrK3/DBI4=;
        b=aVXpPrlWzWH2r2VGfx7nvaFDfqf8LH0Yf25RZjWdgxaFs835Q+m7hOCQEjt/lemLJS
         NHXr254FS1950VDfEG104BVzODr6bN+ceDgTz8Z+U1XWf/R+9bmGCvcpghsfB9SmXTD7
         koTlbHjbCGy9CoJ98Nu3+8tEMEPOfM1IXKLQ6Q4cueCaPrig1D5Zcbp+5tD3HZ8ZryC0
         LhUuI/CxZARJa2sXMMVs1Uzs1mvW/zP+UqHod4iDiefyuRg0BBw3UZD4gmlAr+eVCw+q
         LWGnPxfYoQMU2mDKZt3Cgf6yS6FaB1HV9hpAl7w7wNkzSNANZSAOjXxGJn85Kf7mi7RW
         mPFw==
X-Forwarded-Encrypted: i=1; AJvYcCU5YoQcmKIUMNzrTfaR6JUnGFOjTmZV/QSQi4HWpuzsZLt010ay15nBQCK0vGkyjRgdIN7jJ+4wFWk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxqNqhed9O7dr6LaqX9vzpz6DZpRgclMtHqE3VeixPw9DLyVcoy
	NSvbKl4uxsazmaUuGW/rr6gqov5O0suMTJYYBm445H/OuR1YrG2PAu+bu72RjtAz0keay51axV0
	ZrWYP5q/Vl5tp6Xi7nPXeS4Iy5iw/UvT/IOJLCDcNFw==
X-Gm-Gg: ATEYQzzhpN3iNGlERNGz0OmswHIvSKPr6LIQq0PgXsDO9FHZ66kKw3KyOW1lxC3yQTv
	LHdlmjboJIQ8dLOTSny2c6DvRWIrMwbG1gbzHJrfLpAcHukDaXcTy3PYRsj9gd5MonUAca7RCxe
	zLW8IReHaEAQJz8WGjulzMCijFQQ6kqjUUiodnNE2goz57eyHbpV0PQG8u8cxSn548oKgMtS8GO
	TRHRT/r7jeSR/5/7kifBP6FlnvYXKI8CCY36ZSTUtxBhfnpKkuIo0HtKl/vC4eF1XtNxXPWyOXH
	hEHzqyMBNK7lFbrDyAi4+Rps5y/f9b8N7OBTu8acTcNBZYTuCYOWDmWW8fBjEfcfh4ggAi2294w
	gAS83v/F65xrrDJ0Olh5dFbGteoo=
X-Received: by 2002:a05:6820:8118:b0:67e:42ca:bf2 with SMTP id
 006d021491bc7-68220541d3fmr1471004eaf.58.1775219669835; Fri, 03 Apr 2026
 05:34:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com>
 <20260120080013.2153519-6-anup.patel@oss.qualcomm.com> <DH1PTVPUM2UR.2J53ICCVVPAFA@oss.qualcomm.com>
In-Reply-To: <DH1PTVPUM2UR.2J53ICCVVPAFA@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 3 Apr 2026 18:04:18 +0530
X-Gm-Features: AQROBzCgiw5HblgNuoDX5QU1aUCJYkWwlXJ-vtI51cG69rWO0VI_zpIeHFgZcTM
Message-ID: <CAAhSdy25k5YWBxLDhNhPkC79LVOZOdA9ZHHZ+65EgF8jewWa1w@mail.gmail.com>
Subject: Re: [PATCH 05/27] RISC-V: KVM: Factor-out ISA checks into separate sources
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atish.patra@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Shuah Khan <shuah@kernel.org>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_053431_139148_AC651962 
X-CRM114-Status: GOOD (  10.10  )
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

T24gRnJpLCBNYXIgMTMsIDIwMjYgYXQgNzo0NOKAr1BNIFJhZGltIEtyxI1tw6HFmQo8cmFkaW0u
a3JjbWFyQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gMjAyNi0wMS0yMFQxMzoyOTo1MSsw
NTozMCwgQW51cCBQYXRlbCA8YW51cC5wYXRlbEBvc3MucXVhbGNvbW0uY29tPjoKPiA+IFRoZSBL
Vk0gSVNBIGV4dGVuc2lvbiByZWxhdGVkIGNoZWNrcyBhcmUgbm90IFZDUFUgc3BlY2lmaWMgYW5k
Cj4gPiBzaG91bGQgYmUgZmFjdG9yZWQgb3V0IG9mIHZjcHVfb25lcmVnLmMgaW50byBzZXBhcmF0
ZSBzb3VyY2VzLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFudXAucGF0ZWxA
b3NzLnF1YWxjb21tLmNvbT4KPiA+IC0tLQo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3Zt
L2FpYV9kZXZpY2UuYyBiL2FyY2gvcmlzY3Yva3ZtL2FpYV9kZXZpY2UuYwo+ID4gQEAgLTEyLDYg
KzEyLDcgQEAKPiA+ICAjaW5jbHVkZSA8bGludXgva3ZtX2hvc3QuaD4KPiA+ICAjaW5jbHVkZSA8
bGludXgvdWFjY2Vzcy5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC9jcHVmZWF0dXJlLmg+Cj4gPiAr
I2luY2x1ZGUgPGFzbS9rdm1faXNhLmg+Cj4KPiBJIGd1ZXNzIDxjcHVmZWF0dXJlLmg+IGlzbid0
IG5lZWRlZCBhbnltb3JlLAoKT2theSwgSSB3aWxsIGRyb3AgdGhpcyBpbmNsdWRlIGF0IHRoZSB0
aW1lIG9mIG1lcmdpbmcgdGhpcyBwYXRjaC4KCj4KPiBSZXZpZXdlZC1ieTogUmFkaW0gS3LEjW3D
ocWZIDxyYWRpbS5rcmNtYXJAb3NzLnF1YWxjb21tLmNvbT4KClJlZ2FyZHMsCkFudXAKCi0tIApr
dm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
