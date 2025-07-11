Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E19DC83F1A
	for <kvm-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 09:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BY2ucap5RFlMzpsA4N6zwtfXsVGzY3SV+cFJjCIoCiM=; b=jSJ1rERk/R7tXJ
	lohKc87La1AjneRIknqiJ0sD4ielCk2+MT0nAAkIMA9Dau8VohGR85DggWxE0t5blVdDUM4cEe1Nt
	CdlAyUetR9P/bscL1OC+/0zkZRRAhndEgv9ikvdP1DREB4R2TijqbGDHWcoXIfhyOidFsB59ag9pd
	XezdB/qIE01K8w82eTodfGjn03E29VxAsn2ytO7bArpTRZIHvRtNWYgb60JcdSywy9dyqZ63M8APA
	N7n7ZGl5C3KOhAM4+eNexC8hysAVSEHaycMDk2aKD9GCKfamvASvNuXBiUx/ehaapnYIrodhuSPD6
	DsyZ7tz9ZmkIsUS1jGRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua9ww-0000000EHzH-3S0i;
	Fri, 11 Jul 2025 09:21:46 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua94z-0000000E7wv-1NAB
	for kvm-riscv@lists.infradead.org;
	Fri, 11 Jul 2025 08:26:03 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-311bd8ce7e4so1668360a91.3
        for <kvm-riscv@lists.infradead.org>; Fri, 11 Jul 2025 01:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1752222359; x=1752827159; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/A2fAk/hY+VXgln3RIT8cl3wcMIkArGIQeZSyy9BGEA=;
        b=TPUX5tjRepLMsZl6QwfYJoXs+6Yfdes7hEJChnOfQEFYPALLQThCs7NVgDfcqsmCoS
         FDyl3INw9h1G2d5kBb+ey7NDM9BoRdqFDQRhhgLk5NBOBSHtQtIIuPiaBZJmaN3wcsiY
         Q0xeRivQ49A1nPw6dD1Gb33IEwijXgsgAIwq4OFA5Bqvgb7AgrH5j14C0g+O4idEq73H
         0e4Zu+3NZctolOuB/baS6+b1ylctd69ZAwqiY7o425TMYIEPaYdDlk/G6vQ3MMNJ508R
         V8wd2tsTyJXnO0U1+eYtVa8wRiOxRCQBuAIeal2S1gZ7H26o/WrIa39/8iD+QUsqLCB4
         3okw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752222359; x=1752827159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/A2fAk/hY+VXgln3RIT8cl3wcMIkArGIQeZSyy9BGEA=;
        b=VNHx/RTWUWKVLW9fDDl4Zt6q2WBx5JysUE3fqmned6at6NusMywL1Zknk2krg75d/A
         z76qbxnXUxnorz5gTmuTPKn0cysr7AVYug5DhQV0jfuzPd8xMxqiaytj+A3ki0yoJpBm
         70vwevx0LHfP4ypeVC/surHrhTlfSx9Qqd0+PZAmSpXE3nH8TCdyxfereIp2cPvRzflp
         FrXYnJ6tT+SuYcicERt07E6JHADiECRs2lkNRbiVpSWju1wIiqUHqqG2hoPbymRVjVSe
         F3QgN5AYyYNDINqTFcvQUqgOtKIn9v9Yy1klVFj5HudXnbBJc2+oTPUEH176WNbWAqCN
         ahYg==
X-Forwarded-Encrypted: i=1; AJvYcCX/LlW7smdtMmAhI2Gldvkpz0irmyiBbMCUc9Ol+okdlczKbSLzjLuiuR1A/BqxLdCuhV2IH6xUZVc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwLsY5rBPRKsQZtB+St2CGIwVB3JWinQ62ghAqMUicSxMSR5w8q
	B4Y8SbGU3jpd/29kuK6CEWcaq1kUgAvH1ER3OMsKpqVNcg2NZ0JiVnHFzPOMdZrnimxTZMVmZPA
	ok56nq+IUdjQHcpE6mDZCuw5Wjvf7pErsD8nS5Cl0Ig==
X-Gm-Gg: ASbGncvBw4YxDX2Jl3AeRFSn2c9xeWachQM/HIgeQ590iqp7Xp0BUEJdTJm535MgkAK
	HisWHLi/oykKAVTixZ4ibeRFNP6b1LIcTN6X9pJ3rmcKotNSPzjg1eLSVN0cyFJc91qnTvlwpW7
	Atz6wYXuPjbqBmZ7BRk/Dq3QOZDk8DBu6LFztCwlt1P1jt9x9Raod/WC2DUyL2f9etPcm4fhxVc
	KxqUk/DKU+veUcnbvEY
X-Google-Smtp-Source: AGHT+IFCp1pcD9GmdtCsf5iRMPFHSbp9FsiGavSusUMyRrFKZGE3x/NS3PMLeRJnScYqO8frgAwfK8U/bj7U7Muxpzw=
X-Received: by 2002:a17:90a:d88e:b0:312:959:dc4f with SMTP id
 98e67ed59e1d1-31c4cc9d4f4mr3742093a91.5.1752222359484; Fri, 11 Jul 2025
 01:25:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250710133030.88940-1-luxu.kernel@bytedance.com> <DB908AUW6N76.3SYAGIFGCDJ27@ventanamicro.com>
In-Reply-To: <DB908AUW6N76.3SYAGIFGCDJ27@ventanamicro.com>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Fri, 11 Jul 2025 16:25:48 +0800
X-Gm-Features: Ac12FXyVj12e58tShQlG7C9K_6PvavwmURsMwnmPFZyguWbVaWs8xpiRLy86iqI
Message-ID: <CAPYmKFu2Ggu7_SFkrhfKX9rT7Pdas+jSjksGMFAhHf7Wa83Y8g@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2] RISC-V: KVM: Delegate kvm unhandled
 faults to VS mode
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: cleger@rivosinc.com, anup@brainfault.org, atish.patra@linux.dev, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_012601_722751_7FFB4FB8 
X-CRM114-Status: GOOD (  10.98  )
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

T24gRnJpLCBKdWwgMTEsIDIwMjUgYXQgMjoxNuKAr1BNIFJhZGltIEtyxI1tw6HFmSA8cmtyY21h
ckB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IDIwMjUtMDctMTBUMjE6MzA6MzArMDg6MDAs
IFh1IEx1IDxsdXh1Lmtlcm5lbEBieXRlZGFuY2UuY29tPjoKPiA+IERlbGVnYXRlIGZhdWx0cyB3
aGljaCBhcmUgbm90IGhhbmRsZWQgYnkga3ZtIHRvIFZTIG1vZGUgdG8gYXZvaWQKPiA+IHVubmVj
ZXNzYXJ5IHRyYXBzIHRvIEhTIG1vZGUuIFRoZXNlIGZhdWx0cyBpbmNsdWRlIGlsbGVnYWwgaW5z
dHJ1Y3Rpb24KPiA+IGZhdWx0LCBpbnN0cnVjdGlvbiBhY2Nlc3MgZmF1bHQsIGxvYWQgYWNjZXNz
IGZhdWx0IGFuZCBzdG9yZSBhY2Nlc3MKPiA+IGZhdWx0Lgo+ID4KPiA+IFRoZSBkZWxlZ2F0aW9u
IG9mIGlsbGVnYWwgaW5zdHJ1Y3Rpb24gZmF1bHQgaXMgcGFydGljdWxhcmx5IGltcG9ydGFudAo+
ID4gdG8gZ3Vlc3QgYXBwbGljYXRpb25zIHRoYXQgdXNlIHZlY3RvciBpbnN0cnVjdGlvbnMgZnJl
cXVlbnRseS4gSW4gc3VjaAo+ID4gY2FzZXMsIGFuIGlsbGVnYWwgaW5zdHJ1Y3Rpb24gZmF1bHQg
d2lsbCBiZSByYWlzZWQgd2hlbiBndWVzdCB1c2VyIHRocmVhZAo+ID4gdXNlcyB2ZWN0b3IgaW5z
dHJ1Y3Rpb24gdGhlIGZpcnN0IHRpbWUgYW5kIHRoZW4gZ3Vlc3Qga2VybmVsIHdpbGwgZW5hYmxl
Cj4gPiB1c2VyIHRocmVhZCB0byBleGVjdXRlIGZvbGxvd2luZyB2ZWN0b3IgaW5zdHJ1Y3Rpb25z
Lgo+Cj4gKFRoaXMgb3B0aW1pemF0aW9uIHdpbGwgYmUgZXZlbiBtb3JlIHNpZ25pZmljYW50IHdo
ZW4gbmVzdGluZywgd2hlcmUgaXQKPiAgd291bGQgY3VycmVudGx5IGdvIC0+IEhTMCAtPiBIUzEg
LT4gSFMwIC0+IFZTMSwgaW5zdGVhZCBvZiAtPiBWUzEuKQoKTmljZSBzdXBwbGVtZW50ISBUaGFu
a3MuCgo+Cj4gPiBUaGUgZncgcG11IGV2ZW50IGNvdW50ZXJzIHJlbWFpbiB1bmRlbGV0ZWQgc28g
dGhhdCBndWVzdCBjYW4gc3RpbGwgZ2V0Cj4gPiB0aGVzZSBldmVudHMgdmlhIHNiaSBjYWxsLiBH
dWVzdCB3aWxsIG9ubHkgc2VlIHplcm8gY291bnQgb24gdGhlc2UKPiA+IGV2ZW50cyBhbmQga25v
dyAnZmlybXdhcmUnIGhhcyBkZWxlZ2F0ZWQgdGhlc2UgZmF1bHRzLgo+ID4KPiA+IFNpZ25lZC1v
ZmYtYnk6IFh1IEx1IDxsdXh1Lmtlcm5lbEBieXRlZGFuY2UuY29tPgo+ID4gLS0tCj4KPiBSZXZp
ZXdlZC1ieTogUmFkaW0gS3LEjW3DocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+CgotLSAK
a3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
