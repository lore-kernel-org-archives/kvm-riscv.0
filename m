Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C21C0218D
	for <kvm-riscv@archiver.kernel.org>; Tue, 28 Jan 2025 05:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ds3HYz8gQwxIA88aF7f6jnrArkcp5LKTJDRBCETaw4I=; b=AE++lQ/Z4M+jPD
	5HprfKMYAVU1plegBjx2ySfoV9lCeDj+zIcB7UlrNssp0i63g1z2PkNcqgZwAlQ/liUa26EPeXAN1
	0WqVTaPcFgrb4aBlQ7hL09dM37cEIKQEIwcL5+WyOnSr/Gf3NyZN4Wh18heLmfFEq/mWIxe8AJvT2
	jnTQ41fn4Rwzo99YitfUNwtEFrw37wMY6xfKMbVCwPxhOMaMq85DcL+Z1CQdMnS4op0sdfC18aZz0
	Skd627yy0s6R6Cllo6AkN7qKUifQaEBCNNkCVK1x/JVoc74j5k9ezO4Fz049bFGxdPpPZ0BU/vwal
	KIKrg5AKNwNMGV3pIUKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcdrx-000000047OT-0knd;
	Tue, 28 Jan 2025 05:10:37 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcdhh-000000044Su-0pnk
	for kvm-riscv@lists.infradead.org;
	Tue, 28 Jan 2025 05:00:02 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2f44353649aso6915610a91.0
        for <kvm-riscv@lists.infradead.org>; Mon, 27 Jan 2025 21:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738040400; x=1738645200; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5mrMIkTEe6NxNBfmJmR1XKICEvWgZ9tUVZlETsQZaOc=;
        b=MB6KwsivqhSauH4NK9b/ywiuYh2S8sWUsMLfHA1EzVm8tTmRTVW3b1slen6oCP8Naz
         TFj5bEYRXIDulck0PB+Np6zc5DQT9oPYskv9cD5e6R1oz/OfWgFZiN6QjlenYm5HJeMX
         hJ7HHt5OM1Axc3VKTlgantnIxZ3OuZRMPS8wdQFlAy8W+4ygzfCSzKBbTGSSui5nnFsR
         Sv4PQ+d1HRxLuymX3CnlGD6oU2nUcfpt07YB3QGMtMlU+o1rnPfB82UbIV61KtgnEo9+
         39RYTSO/iMah1GHtW/C+tIWppHPH6dZXXZ4B5p/UklL88z2G4Pk46BBRMOtXwhvpvTEC
         jCSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738040401; x=1738645201;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5mrMIkTEe6NxNBfmJmR1XKICEvWgZ9tUVZlETsQZaOc=;
        b=NWGthHrlQpDvH1+UAB/negoKP7bmGcPK/iyEx4hIKPf+MfXhIQtSUnW5ubl69aEWEX
         tNL15l5jOlJjc8fHjxMPFfqhM0BShPX/5RiPaU72/ZwB3ZOM1K01177TFfhNop7ifsOY
         uJGTKpNpiWFvX+nGwm/c9t+e6xBPusyoCylNwabussNDoA61FnoJfG2rWeDkxFqtrNDf
         GQshP+8Y6eTN3exWUiXI4Vd67qMGFO3rddKFLsJpN6aOsblkIDsYESesGcguMR56qODo
         ISm5YABCrI6HqOGiFeAjgvv/Ua1IPJC9FhrC1YP53+/uR9MFSjAmip3ieLzvdWuH/Wzj
         hlkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWo1U9iN32m9Hk3vVpWKRucWdaoijX7nICblLsfePUB1eJ8WLiU7dBp/GsQf0zepj1sJIK7+4XPHsk=@lists.infradead.org
X-Gm-Message-State: AOJu0YyZIPnm6H/mbvhZqmzGCW7GjCCl5g/9ZcBHtJg4pSzPIo7+X5mB
	KDx3MgsXwIvczyBAGRV3EYl1HiLInRh7YX19vz2hAnoxalC8VpkjMgyqRHRknB4=
X-Gm-Gg: ASbGncv7H/iRwSNKevFzVjua+la/uwRYZUDyl15GBFNSe3jCJcd+5krIX02XXDSn5Fg
	3aY1QC7pKMDVui0xij5RwmcsqeTWDlOjoZiV+uqwKs0BTcwCrEdbBdH+4QU1vVSANuEAkBI3aLB
	RsYzSi7mJj7QHcWCH7xnCw7iaLEQTdcVTj09i6BwZ+pM5amf9s1D0t6yt6pucfti92NrE0Akplo
	BJjr46k2sgvldVLqckn2ZJr2io4Y+2z3mfNPSvhMSp5iw1gF23YjzEOBWi/QhTX89D5b0ELyGVQ
	MqM0lt1EjPN/BGOd7u/5hoFO2Z68
X-Google-Smtp-Source: AGHT+IH1CyamZ5GxB/LaeGh1+pUXZNcyZ/3f2i2HBGmcLQlGMYAJa1S5yIJT+e6qxkT5U/Ox2SNkIQ==
X-Received: by 2002:a17:90b:288a:b0:2ee:bc7b:9237 with SMTP id 98e67ed59e1d1-2f782d35fafmr61340887a91.27.1738040400688;
        Mon, 27 Jan 2025 21:00:00 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa5a7f7sm8212776a91.11.2025.01.27.20.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 21:00:00 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 27 Jan 2025 20:59:48 -0800
Subject: [PATCH v3 07/21] RISC-V: Add Ssccfg ISA extension definition and
 parsing
MIME-Version: 1.0
Message-Id: <20250127-counter_delegation-v3-7-64894d7e16d5@rivosinc.com>
References: <20250127-counter_delegation-v3-0-64894d7e16d5@rivosinc.com>
In-Reply-To: <20250127-counter_delegation-v3-0-64894d7e16d5@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atishp@atishpatra.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, weilin.wang@intel.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_210001_357815_16B83581 
X-CRM114-Status: GOOD (  10.13  )
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

U3NjY2ZnICjigJhTc+KAmSBmb3IgUHJpdmlsZWdlZCBhcmNoaXRlY3R1cmUgYW5kIFN1cGVydmlz
b3ItbGV2ZWwKZXh0ZW5zaW9uLCDigJhjY2Zn4oCZIGZvciBDb3VudGVyIENvbmZpZ3VyYXRpb24p
IHByb3ZpZGVzIGFjY2VzcyB0bwpkZWxlZ2F0ZWQgY291bnRlcnMgYW5kIG5ldyBzdXBlcnZpc29y
LWxldmVsIHN0YXRlLgoKVGhpcyBwYXRjaCBqdXN0IGVuYWJsZXMgdGhlIGRlZmluaXRpb25zIGFu
ZCBlbmFibGUgcGFyc2luZy4KClNpZ25lZC1vZmYtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2
b3NpbmMuY29tPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCB8IDIgKysKIGFy
Y2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyB8IDIgKysKIDIgZmlsZXMgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5o
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCmluZGV4IDNkNmU3MDZmYzViMi4uMmY1
ZWYxZGVlN2FjIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKKysr
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCkBAIC0xMDIsNiArMTAyLDggQEAKICNk
ZWZpbmUgUklTQ1ZfSVNBX0VYVF9TVkFEVQkJOTMKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9TU0NT
UklORAkJOTQKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9TTUNTUklORAkJOTUKKyNkZWZpbmUgUklT
Q1ZfSVNBX0VYVF9TU0NDRkcgICAgICAgICAgICA5NgorI2RlZmluZSBSSVNDVl9JU0FfRVhUX1NN
Q0RFTEVHICAgICAgICAgIDk3CiAKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9YTElOVVhFTlZDRkcJ
MTI3CiAKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyBiL2FyY2gv
cmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwppbmRleCBkMzI1OWI2NDAxMTUuLmI1ODRhYTJkNWJj
MyAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCisrKyBiL2FyY2gv
cmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwpAQCAtMzkwLDEyICszOTAsMTQgQEAgY29uc3Qgc3Ry
dWN0IHJpc2N2X2lzYV9leHRfZGF0YSByaXNjdl9pc2FfZXh0W10gPSB7CiAJX19SSVNDVl9JU0Ff
RVhUX0JVTkRMRSh6dmtzZywgcmlzY3ZfenZrc2dfYnVuZGxlZF9leHRzKSwKIAlfX1JJU0NWX0lT
QV9FWFRfREFUQSh6dmt0LCBSSVNDVl9JU0FfRVhUX1pWS1QpLAogCV9fUklTQ1ZfSVNBX0VYVF9E
QVRBKHNtYWlhLCBSSVNDVl9JU0FfRVhUX1NNQUlBKSwKKwlfX1JJU0NWX0lTQV9FWFRfREFUQShz
bWNkZWxlZywgUklTQ1ZfSVNBX0VYVF9TTUNERUxFRyksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEo
c21tcG0sIFJJU0NWX0lTQV9FWFRfU01NUE0pLAogCV9fUklTQ1ZfSVNBX0VYVF9TVVBFUlNFVChz
bW5wbSwgUklTQ1ZfSVNBX0VYVF9TTU5QTSwgcmlzY3ZfeGxpbnV4ZW52Y2ZnX2V4dHMpLAogCV9f
UklTQ1ZfSVNBX0VYVF9EQVRBKHNtc3RhdGVlbiwgUklTQ1ZfSVNBX0VYVF9TTVNUQVRFRU4pLAog
CV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNtY3NyaW5kLCBSSVNDVl9JU0FfRVhUX1NNQ1NSSU5EKSwK
IAlfX1JJU0NWX0lTQV9FWFRfREFUQShzc2FpYSwgUklTQ1ZfSVNBX0VYVF9TU0FJQSksCiAJX19S
SVNDVl9JU0FfRVhUX0RBVEEoc3Njc3JpbmQsIFJJU0NWX0lTQV9FWFRfU1NDU1JJTkQpLAorCV9f
UklTQ1ZfSVNBX0VYVF9EQVRBKHNzY2NmZywgUklTQ1ZfSVNBX0VYVF9TU0NDRkcpLAogCV9fUklT
Q1ZfSVNBX0VYVF9EQVRBKHNzY29mcG1mLCBSSVNDVl9JU0FfRVhUX1NTQ09GUE1GKSwKIAlfX1JJ
U0NWX0lTQV9FWFRfU1VQRVJTRVQoc3NucG0sIFJJU0NWX0lTQV9FWFRfU1NOUE0sIHJpc2N2X3hs
aW51eGVudmNmZ19leHRzKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQShzc3RjLCBSSVNDVl9JU0Ff
RVhUX1NTVEMpLAoKLS0gCjIuMzQuMQoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
