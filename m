Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1813CD6E55
	for <kvm-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 08:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PTZ6Cr7XB/I/ynnG9WLl1+hpXKCbQ6zI5QnEkofvDrQ=; b=rnmYRF8OZ9yxxL
	30Z8cw49fU9FLE3klKBXOp6O6Ag0p0RQVnbYAHfkCyDw5jMHcbyY961vtgtlgSHExcOp7Uy6nD7HO
	7GV9z7j8n87YNwQZb5H8SqNwcayn6hZTBZkb4mn3W72bfU65lInhqQPH3fbiKxKzwR7ovH9/K1WXM
	bWThQPNjQWw6a3Yk1o4OsP6xmti3KbCRORGDqaABFn5s2B5nznSqQjmq5phrChoaPQ6aQ6hTvtiQy
	KBWSg2mMpzvEJKVmr6C0TOjkVwwHhxox7qddabbLa13iwVx60tT1jMHeMsYZYgaZf2lBThqdPjdCA
	VJ5nM8pymSNEcq+jjGow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgZ1-0000000EXKE-2Kpo;
	Wed, 03 Jun 2026 08:02:59 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgYx-0000000EXJG-3ube
	for kvm-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 08:02:57 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-36ba3ea5c46so3345415a91.1
        for <kvm-riscv@lists.infradead.org>; Wed, 03 Jun 2026 01:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780473775; x=1781078575; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9MuF+yWJKjzDQs0kKZtPPTCGk9WmA5u/lg0Mr9iL+po=;
        b=qx0L3e/ksbu0dkw/rsdap1sDAAcMmmOiysHuTsAfw7S+0NyROdbINYmRVAcrcx4TJ4
         0TZWbQjp4ZENSlbqH0zd8aj36YZgEQCADEje9AH3l4eq16cvmbXFher7RzwOkZ/119uo
         FM9if6CeY8nhQS/iPP+0RKBHFOgAOPuTUV0JuI3G4XQAPaCR6ImzghgEFw9NJj2Y5UFl
         fWkkmH4HTBK05n3RIWPGo2pshQyGz6ALU+29R1DO6dIia+I2OEO49JzAlTky0QHhOrpz
         DERFP2K/qW03FyT46F+i6oJ63XOLXObnlvsL66F0VAkFdIcR9zl4J0bJqePHY3YJIoat
         uZjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780473775; x=1781078575;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9MuF+yWJKjzDQs0kKZtPPTCGk9WmA5u/lg0Mr9iL+po=;
        b=JloygJMFm7DIUFxb5Z89FD6piNJSvFRMsYnMyuz24uTuI3kB6KM+ZXgLhq1G4uD2mp
         91OSkj0P7i8xIluH42JY+uJQ3jfMhqOXfPTGGiuFBdcz7pDnjqDRkZ3q7LRiDW+ClF+R
         Y2YUHoW4HUje4eI/l0qfJbejkwjUgFPjcCBoyI+feGLYIPVO1gK18LuIUgZ+wOGgcsk/
         KGmsqKcXRPpWt4CJe0w9J+7Xa4z/Hv7XOvntQ4bp4gVjRIe3V5GKOy9E1HCnW8NwSghv
         0ruf8nkgUvpRP1e9CuZ5xTnkSQ7MzopIuvKX8/FJz1mmjebDHLNnRW0PC8PrSaQOJdUv
         UcAQ==
X-Forwarded-Encrypted: i=1; AFNElJ+4EmXke9aciJQqKJf60ZMSrTE5fRmWzeFKjTuZvAAQrHLgAneEzJXuHvUjkL17vzPtjJXGbKOtHIg=@lists.infradead.org
X-Gm-Message-State: AOJu0YwfkJkrx4TGEO3nDCGZlOU8Fh5qgc3EKJDfzz+s0z5Ygb/eCG5e
	1kbLUoPfhFDwm8EWhyAOJlwsclheOPz6JFSy4HBJEReUoY1aJ4zyeKwW
X-Gm-Gg: Acq92OHl/HCRCO6r38NJvhF7P7fiwVZ16iV9eGWDbp0sYY7BSSCIjEZkHRHrDNMEIAh
	yrIlfZVig6d9EQSXwX961IcRQ6UsAaZu4MWmVan6DvXA/QXkwjE38poAlpkeCNHmORRhWSLG7kS
	1f96+TRbA/z9ZLjMJmIPvO2vFynqiA0VchTvlAOVexxyNFNdkPDi3NXzNlmAz3VTU6FAlfEXuAg
	e54ypJnTHLp2itLphxygBWG7vrcmEp9Wp//fwGmkG33eZ9es31Ypz4mFwVPneRAC7+WIIgIManS
	htnGnHCcudqfy8bsn/U2Hh+1RjPjzS3Odjey6HvVNg4ihucvq3gFmY61Iea+DTNYLvaqRYhdyoW
	SscAZGNhzdVboCMZ0oFf15/TmOHRt15tZt02hsoUmH5Xla4PbYJKqACWS6ity8XATNZBfHFOQZA
	D5s8INqOLpHmmDmyH+lWueS3VaZ/oqLWHE+Q==
X-Received: by 2002:a17:90b:5610:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-36e30d1c00fmr2269817a91.8.1780473774886;
        Wed, 03 Jun 2026 01:02:54 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd98797fesm5144475a91.13.2026.06.03.01.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 01:02:54 -0700 (PDT)
Date: Wed, 3 Jun 2026 16:02:35 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Anup Patel <anup@brainfault.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Atish Patra <atish.patra@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Deepak Gupta <debug@rivosinc.com>, 
	Thomas Huth <thuth@redhat.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Sergey Matyukevich <geomatsi@gmail.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>, 
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: Re: [PATCH v2 4/7] RISC-V: KVM: Allow Zicfiss/Zicfilp extensions for
 Guest/VM
Message-ID: <ah_fkXOLpNHvnmNM@inochi.infowork>
References: <20260601084336.2601675-1-inochiama@gmail.com>
 <20260601084336.2601675-5-inochiama@gmail.com>
 <ah1pgb4S-UoSWhC_@inochi.infowork>
 <CAAhSdy0ZycwjYrKowzaydKhh=fcEDD9-C6TKmb838s0hq8a2hA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy0ZycwjYrKowzaydKhh=fcEDD9-C6TKmb838s0hq8a2hA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_010255_995089_A70714A5 
X-CRM114-Status: GOOD (  16.52  )
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

T24gV2VkLCBKdW4gMDMsIDIwMjYgYXQgMDE6MTY6MTRQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBNb24sIEp1biAxLCAyMDI2IGF0IDQ6NDbigK9QTSBJbm9jaGkgQW1hb3RvIDxpbm9j
aGlhbWFAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBNb24sIEp1biAwMSwgMjAyNiBhdCAw
NDo0MzozMlBNICswODAwLCBJbm9jaGkgQW1hb3RvIHdyb3RlOgo+ID4gPiBFeHRlbmQgdGhlIEtW
TSBJU0EgZXh0ZW5zaW9uIGFycmF5IHRvIGFsbG93IEtWTSB1c2Vyc3BhY2UgdG8KPiA+ID4gZGV0
ZWN0IGFuZCBlbmFibGUgWmljZmlzcy9aaWNmaWxwIGV4dGVuc2lvbnMgZm9yIEd1ZXN0L1ZNLgo+
ID4gPgo+ID4gPiBBc3Npc3RlZC1ieTogWXVhblNoZW5nOmNsYXVkZS00Ljctb3B1cwo+ID4gPiBD
by1kZXZlbG9wZWQtYnk6IFF1YW4gWmhvdSA8emhvdXF1YW5AaXNjYXMuYWMuY24+Cj4gPiA+IFNp
Z25lZC1vZmYtYnk6IFF1YW4gWmhvdSA8emhvdXF1YW5AaXNjYXMuYWMuY24+Cj4gPiA+IFNpZ25l
ZC1vZmYtYnk6IElub2NoaSBBbWFvdG8gPGlub2NoaWFtYUBnbWFpbC5jb20+Cj4gPiA+IC0tLQo+
ID4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oIHwgMiArKwo+ID4gPiAgYXJj
aC9yaXNjdi9rdm0vaXNhLmMgICAgICAgICAgICAgIHwgMiArKwo+ID4gPiAgMiBmaWxlcyBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKykKPiA+ID4KPiA+Cj4gPiBJIGhhdmUgZm9yZ290IHRvIGFkZCBD
U1JfU1NQIHRvIHRoZSBjb250ZXh0LCB3aWxsIGFkZCBpbiB0aGUgbmV4dAo+ID4gdmVyc2lvbi4g
QnV0IEkgaGF2ZSBhIHNtYWxsIHF1ZXN0aW9uIGZvciBpdDogY291bGQgSSByZXVzZSB0aGUKPiA+
IGdlbmVyaWMgc3VidHlwZSBvciB1c2UgYSBuZXcgQ1NSIHN1YnR5cGU/Cj4gPgo+IAo+IEFkZCBh
bm90aGVyIENTUiBzdWJ0eXBlIGZvciBaaWNmaXNzLgo+IAo+IFJlZ2FyZHMsCj4gQW51cAoKVGhh
bmtzLCBJIHdpbGwgZG8gaXQuCgpSZWdhcmRzLApJbm9jaGkKCi0tIAprdm0tcmlzY3YgbWFpbGlu
ZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
