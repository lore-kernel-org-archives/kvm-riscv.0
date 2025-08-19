Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78C9CA0EE6
	for <kvm-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 06:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v6aJcqsq6xYutc0nPCez1xnefltiK4fhzQc5QBvqaTc=; b=ppU8MCvqZR7pdd
	jTZqNmmOA6dHPUQ+kT661eXqycPkDgGjolmwD8JpSc5a2pRlgs5xSOj2LQpfMX7HkF8BXV8cARxpT
	vYZamBHB0hPfQ34hs4AuiA5wuMAwzmfwa76kWx0vsxR0g59xM+hHaWEDHXakHIJitMFJug7ACRs2O
	kx1poAsd30/hcuk394R9KSIlGk9djQJkpLflq83EqyXAjqQ6yxLXlFBtciODScEmq1epKSIrtMMRZ
	wRY4VaL0ovj+Cf4Fv3NbTxKtezD19gOrVeNIcsGPuyYf/yZKkL3lUuqIX0eQOiuIoSvZyjKPZypGg
	+Lh8iZ8JM09xRd7DCR2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoFs5-00000009XRj-0Gsr;
	Tue, 19 Aug 2025 06:31:01 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoFs2-00000009XQ9-17Tv
	for kvm-riscv@lists.infradead.org;
	Tue, 19 Aug 2025 06:30:59 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-55ce508cfe0so4808228e87.0
        for <kvm-riscv@lists.infradead.org>; Mon, 18 Aug 2025 23:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755585056; x=1756189856; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x5X4ewm5a89y5y4039N/SNIncKcOQEgQsBChRS5leiM=;
        b=E7bdAzx0GkUK3F1+UwYe4/y/1cosSf+xN+lJh46DUvGlSk7c5Oo1JAjcsrmxsNmuZN
         us2nGfTitwYZxcgyi4X3vbvvybQJIlFMx3BWuk7IKTzlppVAfMMY7d0jTLScTJt7ySBH
         dTg2oMty485ijACv8EAaxr34QbaNzV2hBRG3X11g3SuXomE3lYPpsL346xPxElo+XaoE
         +B7Alc1sZS57tVUBsJPWr+t4d7yOXOPEV7d3VhxZFyboWlpPhRVqy0X6+vyuci3cBUw/
         H9Tpbav1llqHUPGxHsvGghYVV03EKJouDCS+SLy++qAXVc/397L7Jct3bhVutVoWG7fA
         hAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755585056; x=1756189856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x5X4ewm5a89y5y4039N/SNIncKcOQEgQsBChRS5leiM=;
        b=dUVqDF9Dn77lQVgGIt3LiGdkKZ+oRSwJYvdwjGlBmW0KLVXvKRNe5ohb93iWIdf2X0
         HaKKNpeQiiZFbPb6QPVgv6L4gO1jBiRk/4j0mKIT7U3P2ae7RxHWko3kNOCCmS2j1Cc2
         VL8HrJtR1VYa2fB1WnKfqxE7OaPcC5vpLdImshD+fbX/LlTm/CJ/8BxgBHPbNE35jLRO
         M7Gem22Q4KZP3Jm4bMUKcAggYWBwURSpHUb/Cg4pPNbx7lQG/LqNwVl0D8vuhDQ+5z6/
         vqh/c7MvtNmJyjjfWrfOrEmxjY+wUXoMKSMUUCI2AxTW2nf0shqG4SbYq/K55I0GWgaZ
         uFcw==
X-Forwarded-Encrypted: i=1; AJvYcCXPWZBNyThkT0ZGSGgeRMSIGWa3+UHvAWde4jMeSBhVaKAGdDKbITavE9IRc/Z4CwX2BiRJi5kGNr0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz26LlufCsKBu2F3xgZZc5RN64eON85xn3CaSSe96UTdC/G/KNO
	Er8kNIAx7hgY//qTh/5kVIU5e7Z3OKKjtTyH5XVwkh9WsSaWnSM54B3EU7xwwHN837c7OzZxXyX
	yJltYQUaVF4XJuNkPETLAvdDyLAH+TB+eDmFYLFkKNQ==
X-Gm-Gg: ASbGncuFz2mpYnbGHL/bNNXlFaE0WqO1CAZU3iaNfxsLleWacRO2s83b8T5z+oGCPX+
	ljJYKzZ5fdmIXQOwkkm7+IIVi9o6l2flYRh+vObzWk0GJ4IUXV7xvO/eYNOa9oFMTzn8QmVen90
	zQLn+N8kWz5PwM4i+F3HHe3Ik9babBVX9eLSqd8JRm9f5n9nyHJyYxvlZF2+lIZzhK6Y49pJqVi
	4VU0zfeh75C806kUKc=
X-Google-Smtp-Source: AGHT+IHHkURi8B2o/4zRpbceYSK5peOTCukcS7TN3aV1RdQ+I1LvQUMDMhIAD9wu5TYxwZrH3wzL9O70PnE8RRwWRSk=
X-Received: by 2002:a05:6512:2351:b0:553:2e42:fffb with SMTP id
 2adb3069b0e04-55e007af767mr477220e87.33.1755585056179; Mon, 18 Aug 2025
 23:30:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250814155548.457172-1-apatel@ventanamicro.com> <DC5HEJRMZ84K.34OPU922A7XBE@ventanamicro.com>
In-Reply-To: <DC5HEJRMZ84K.34OPU922A7XBE@ventanamicro.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 19 Aug 2025 12:00:43 +0530
X-Gm-Features: Ac12FXyJ8d4Eeyc3Nquuqj0vADLxjc_tq1DtUjG2ODWh3IKeJDYP9l_pzAP_rIM
Message-ID: <CAK9=C2X8-DBi7qQ87kMA0AiVdiFH0_4L4mzzZzbeCg2eiNm8Qg@mail.gmail.com>
Subject: Re: [PATCH 0/6] ONE_REG interface for SBI FWFT extension
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: Atish Patra <atish.patra@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_233058_307360_98134475 
X-CRM114-Status: GOOD (  19.65  )
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

T24gTW9uLCBBdWcgMTgsIDIwMjUgYXQgMzo1OeKAr1BNIFJhZGltIEtyxI1tw6HFmSA8cmtyY21h
ckB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IDIwMjUtMDgtMTRUMjE6MjU6NDIrMDU6MzAs
IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPjoKPiA+IFRoaXMgc2VyaWVzIGFk
ZHMgT05FX1JFRyBpbnRlcmZhY2UgZm9yIFNCSSBGV0ZUIGV4dGVuc2lvbiBpbXBsZW1lbnRlZAo+
ID4gYnkgS1ZNIFJJU0MtVi4KPgo+IEkgdGhpbmsgaXQgd291bGQgYmUgYmV0dGVyIHRvIE9ORV9S
RUcgdGhlIENTUnMgKG1lZGVsZWcvbWVudmNmZyksIG9yIGF0Cj4gbGVhc3QgZXhwb3NlIHRoZWly
IENTUiBmaWVsZHMgKGVhY2ggc2Vuc2libGUgbWVkZWxlZyBiaXQsIFBNTSwgLi4uKQo+IHRocm91
Z2gga3ZtX3Jpc2N2X2NvbmZpZywgdGhhbiB0byBjb3VwbGUgdGhpcyB3aXRoIFNCSS9GV0ZULgo+
Cj4gVGhlIGNvbnRyb2xsZWQgYmVoYXZpb3IgaXMgZGVmaW5lZCBieSB0aGUgSVNBLCBhbmQgdXNl
cnNwYWNlIG1pZ2h0IHdhbnQKPiB0byBjb25maWd1cmUgdGhlIFMtbW9kZSBleGVjdXRpb24gZW52
aXJvbm1lbnQgZXZlbiB3aGVuIFNCSS9GV0ZUIGlzIG5vdAo+IHByZXNlbnQsIHdoaWNoIGlzIG5v
dCBwb3NzaWJsZSB3aXRoIHRoZSBjdXJyZW50IGRlc2lnbi4KPgo+IElzIHRoZXJlIGEgYmVuZWZp
dCBpbiBleHByZXNzaW5nIHRoZSBJU0EgbW9kZWwgdGhyb3VnaCBTQkkvRldGVD8KPgoKRXhwb3Np
bmcgbWVkZWxlZy9tZW52Y2ZnIGlzIG5vdCB0aGUgcmlnaHQgYXBwcm9hY2ggYmVjYXVzZSBhCkd1
ZXN0L1ZNIGRvZXMgbm90IGhhdmUgTS1tb2RlIGhlbmNlIGl0IGlzIG5vdCBhcHByb3ByaWF0ZSB0
bwpleHBvc2UgbTx4eXo+IENTUnMgdmlhIE9ORV9SRUcgaW50ZXJmYWNlLiBUaGlzIGFsc28gYWxp
Z25zCndpdGggSC1leHRlbnNpb24gYXJjaGl0ZWN0dXJlIHdoaWNoIGRvZXMgbm90IHZpcnR1YWxp
emUgTS1tb2RlLgpXZSBhbHJlYWR5IGhhZCBkaXNjdXNzaW9ucyBhYm91dCB0aGlzIGluIHRoZSBw
YXN0LgoKQXMgc3VjaCwgd2UgaGF2ZSB0d28gb3B0aW9ucy4gT25lIG9wdGlvbiBpcyB0byBleHBv
c2UKaGVkZWxlZy9oZW52Y2ZnIHZpYSBrdm1fcmlzY3ZfY29uZmlnIGFuZCBhbm90aGVyIG9wdGlv
bgppcyB0byBoYXZlIGEgc2VwYXJhdGUgT05FX1JFRyBmb3IgZWFjaCBGV0ZUIGZlYXR1cmUuCgpT
ZXBhcmF0ZSBPTkVfUkVHIHJlZ2lzdGVycyBmb3IgZWFjaCBGV0ZUIGZlYXR1cmUgaXMgYmV0dGVy
CnRoYW4gZGlyZWN0bHkgZXhwb3NpbmcgaGVkZWxlZy9oZW52Y2ZnIHZpYSBPTkVfUkVHIGJlY2F1
c2U6CgoxKSBPbmNlIG5lc3RlZCB2aXJ0dWFsaXphdGlvbiBsYW5kcywgd2Ugd2lsbCBiZSBoYXZp
bmcgc2VwYXJhdGUKaGVkZWxlZy9oZW52Y2ZnIGFzIHBhcnQgb2YgbmVzdGVkIHZpcnR1YWxpemF0
aW9uIHN0YXRlIG9mIEd1ZXN0CndoaWNoIGlzIHRyYXAtbi1lbXVsYXRlZCBieSBLVk0uIFRoZSBl
eGlzdGVuY2Ugb2YgaGVkZWxlZy9oZW52Y2ZnCmluIGt2bV9yaXNjdl9jb25maWcgYW5kIG5lc3Rl
ZCB2aXJ0dWFsaXphdGlvbiBzdGF0ZSB3aWxsIG9ubHkgY3JlYXRlCm1vcmUgY29uZnVzaW9uLgoK
MikgTm90IGFsbCBiaXRzIGluIGhlZGVsZWcvaGVudmNmZyBhcmUgdXNlZCBmb3IgRldGVCBzaW5j
ZSBxdWl0ZQphIGZldyBiaXRzIGFyZSBwcm9ncmFtbWVkIHdpdGggZml4ZWQgdmFsdWUgYmFzZWQg
b24gS1ZNCmltcGxlbWVudGF0aW9uIGNob2ljZXMgKHdoaWNoIG1heSBjaGFuZ2UgaW4gZnV0dXJl
KS4gQWxzbywKdGhpbmdzIGxpa2Ugc2V0X2RlYnVnX2lvY3RsKCkgY2hhbmdlIGhlZGVsZWcgYXQg
cnVudGltZQp3aGljaCBhbGxvdyBLVk0gdXNlciBzcGFjZSB0byBkZWNpZGUgd2hvIHRha2VzIGJy
ZWFrcG9pbnQKdHJhcHMgZnJvbSBHdWVzdC9WTS4gVGhpcyBtZWFucyB2YWx1ZSBzYXZlZC9yZXN0
b3JlZAp0aHJvdWdoIGhlZGVsZWcvaGVudmNmZyBpbiBrdm1fcmlzY3ZfY29uZmlnIGJlY29tZXMK
c3BlY2lmaWMgdG8gdGhlIGtlcm5lbCB2ZXJzaW9uIGFuZCBzcGVjaWZpYyB0byBob3N0IElTQSBm
ZWF0dXJlcy4KCjMpIFdlIGFueXdheSBuZWVkIHRvIHByb3ZpZGUgT05FX1JFRyBpbnRlcmZhY2Ug
dG8Kc2F2ZS9yZXN0b3JlIEZXRlQgZmVhdHVyZSBmbGFncyBzbyBpdCdzIGJldHRlciB0byBrZWVw
IHRoZQpGV0ZUIGZlYXR1cmUgdmFsdWUgYXMgcGFydCBvZiB0aGUgc2FtZSBPTkVfUkVHIGludGVy
ZmFjZS4KCjQpIFRoZSBhdmFpbGFiaWxpdHkgb2YgcXVpdGUgYSBmZXcgRldGVCBmZWF0dXJlcyBp
cyBkZXBlbmRlbnQKb24gY29ycmVzcG9uZGluZyBJU0EgZXh0ZW5zaW9ucyBzbyBoYXZpbmcgc2Vw
YXJhdGUgT05FX1JFRwpyZWdpc3RlcnMgb2YgZWFjaCBGV0ZUIGZlYXR1cmUgYWxsb3dzIGdldF9y
ZWdfbGlzdF9pb2N0bCgpIHRvCnByb3ZpZGUgS1ZNIHVzZXItc3BhY2Ugb25seSBhdmFpbGFibGUg
RldGVCBmZWF0dXJlIHJlZ2lzdGVycy4KClJlZ2FyZHMsCkFudXAKCi0tIAprdm0tcmlzY3YgbWFp
bGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
