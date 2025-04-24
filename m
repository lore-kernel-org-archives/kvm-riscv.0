Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCD7C369AB
	for <kvm-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 17:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MqKwE/iCxDgjIEk3/edF89CzpolhRAxbtCkqz1fh3Ks=; b=Zn6s1F0A7lifIU
	Mya20ddRJypzxT2FEFyFW+SsTh5EIB1JAj3SYg/6bsgdc2up5MB5ajgUUXo4FnF7CDuhnP8lDLYlk
	J/Ee8UgQVmKCBtgjiD5aVWQHNYlhY5wg9iZH5wJAxxEdCDuKn0CWREeBCf1MhbpdcyydwC63mCqLd
	qf/uRe5NvkfjduooDpmgXpn+dXx80eDT7RrDySW8wYbC0WZdI0QjRZUAGUg6Ff1CFl15o5OCdsYSE
	INJ8ZYh2S1J2U0qecic13XQOGfPI4hXzKrsZvBAlcRFJD7LfxoSivUOa7pTpWZg82ltXyrSRSFwlP
	au2xJF7E43RfpbA3Ii/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u80SL-0000000EuHZ-1Whq;
	Thu, 24 Apr 2025 17:33:49 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u80SI-0000000EuFA-1fTh
	for kvm-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 17:33:48 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-224019ad9edso18882195ad.1
        for <kvm-riscv@lists.infradead.org>; Thu, 24 Apr 2025 10:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745516025; x=1746120825; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MqV/L1fucoXh0zEq3ZbEkv0iZBTOf63rS7eOzOMDARE=;
        b=MR415BQnKSlAIPMdxj8qqqiAtYiG+29HnWOSUrn18JvWUGWwMCmuB/QEzd6arMORha
         pie3BhVAtDZp6ts8jGIRuTQgEZWUf33TPvbHilG4PcXV0y3fEFImiiaAak3jH8BgXDUR
         B47i/FxzZYr4mCFX6a3zrTGKybDWG/Wz0mjfB3w4T8mLK+TgnI4JVOmr893J7r/cfcQP
         GGuqAuNo8zCgDY3eBDBGHmtsinFFPiO/gW6TYedRSuILQgJ0x4SzVhkm2L5bOj7UeMpZ
         xrCs68pxYprcKLfefrh7fm8i/HL14mh5dHQiQNNwAm261+GdnD4x8tR+tQZZ5V/4Qm2e
         XJAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745516025; x=1746120825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MqV/L1fucoXh0zEq3ZbEkv0iZBTOf63rS7eOzOMDARE=;
        b=K7WTIosXU3CvV+IbUp8HCuk4BcNDALRm/umjXM8SgWPuvFQssyB4G/O7Jtt1cEeEz3
         kU11v0Zwiy7S8QifbMbUMSXIff3q/HAQdhih4Ott/7PlIOG+7UEISMOuLLtqgqEUdTJh
         Kj+XmgAsCWrEOApmT2uHy7O2QXGXs1WB9bUW1flo0R2DAzKtZse7fC2sT+VP86PUSfE+
         HGSkmXFNW3pBl7Vm2SV/NqO+yWPdF9D2UXvsa9iLnOYtPqmzTcnfmV5kkB5SPInVEkq2
         /Jhd/oNmp1KTjz4AqVuLXKa7JMNnno+/39ig+KCCQttmmyHLvHGh5KABpsi7TXlq7UcL
         OhMg==
X-Forwarded-Encrypted: i=1; AJvYcCVFsiMLf7ShZWOJsHCqoy6bGYL5zHNSYJfUz57NQ/cQ1wNVN7xxFBi0TemS80leJ72nq1tlrBUjZO8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwWT5PErHOqbPGPnIub3784eZgdaU0kCfAuKd6o+K1DGGkNyWqk
	7IVC0n1X89tbPfSdmYULVyMXrezw5sfSwCZzaRoQrEII5tLvAbTd8qgZaLs7BIk=
X-Gm-Gg: ASbGncuyLHEnP3eGtsc1VcFOPiLLp23a3VJ3Wvq3wvf2TbotZCl3ne/gR0AVs4tqVwz
	DtlOk4YC4ZcOvSa2W26brun9cNSXhfGEMRPkDHSz7PbjZXFZz9MP9SUf8MTPOjSIIwKLhCjbjEQ
	PruW/MCgRxph5Mra39xIuC3G3zaGD1ISuMSlXrfCyG2MAYcy8KJI6YzmCRiP6NKs4tWzsIlfume
	XGI70GrSfwb6y5LQXCXUuer1b4BF2q5T/sbquK/Ml+HRCigYMD4MgwloYmRsjPyLehIdUX7jj/l
	TuX5C3buT4c4ucpVpd6nUR+3GppRSxp6YH+tZdnUNQ==
X-Google-Smtp-Source: AGHT+IGoXel2WMkjiTK/q7g1/yBkqNZ84Lmsw32W4+SLXcM2BGBaWrGqIbaWGI5EV1R0ZMMR1eKW3w==
X-Received: by 2002:a17:903:2445:b0:220:d078:eb33 with SMTP id d9443c01a7336-22db3d71d34mr56439695ad.36.1745516025550;
        Thu, 24 Apr 2025 10:33:45 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5100c4esm16270255ad.173.2025.04.24.10.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 10:33:44 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v6 01/14] riscv: sbi: add Firmware Feature (FWFT) SBI extensions definitions
Date: Thu, 24 Apr 2025 19:31:48 +0200
Message-ID: <20250424173204.1948385-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424173204.1948385-1-cleger@rivosinc.com>
References: <20250424173204.1948385-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_103346_432765_94A8F7E1 
X-CRM114-Status: UNSURE (   8.94  )
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

VGhlIEZpcm13YXJlIEZlYXR1cmVzIGV4dGVuc2lvbiAoRldGVCkgd2FzIGFkZGVkIGFzIHBhcnQg
b2YgdGhlIFNCSSAzLjAKc3BlY2lmaWNhdGlvbi4gQWRkIFNCSSBkZWZpbml0aW9ucyB0byB1c2Ug
dGhpcyBleHRlbnNpb24uCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckBy
aXZvc2luYy5jb20+ClJldmlld2VkLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRA
c2lmaXZlLmNvbT4KVGVzdGVkLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRAc2lm
aXZlLmNvbT4KUmV2aWV3ZWQtYnk6IERlZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPgpS
ZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KLS0tCiBh
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oIHwgMzMgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Ni
aS5oCmluZGV4IDNkMjUwODI0MTc4Yi4uYmIwNzdkMGM5MTJmIDEwMDY0NAotLS0gYS9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3NiaS5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgK
QEAgLTM1LDYgKzM1LDcgQEAgZW51bSBzYmlfZXh0X2lkIHsKIAlTQklfRVhUX0RCQ04gPSAweDQ0
NDI0MzRFLAogCVNCSV9FWFRfU1RBID0gMHg1MzU0NDEsCiAJU0JJX0VYVF9OQUNMID0gMHg0RTQx
NDM0QywKKwlTQklfRVhUX0ZXRlQgPSAweDQ2NTc0NjU0LAogCiAJLyogRXhwZXJpbWVudGFscyBl
eHRlbnNpb25zIG11c3QgbGllIHdpdGhpbiB0aGlzIHJhbmdlICovCiAJU0JJX0VYVF9FWFBFUklN
RU5UQUxfU1RBUlQgPSAweDA4MDAwMDAwLApAQCAtNDAyLDYgKzQwMywzMyBAQCBlbnVtIHNiaV9l
eHRfbmFjbF9mZWF0dXJlIHsKICNkZWZpbmUgU0JJX05BQ0xfU0hNRU1fU1JFVF9YKF9faSkJCSgo
X19yaXNjdl94bGVuIC8gOCkgKiAoX19pKSkKICNkZWZpbmUgU0JJX05BQ0xfU0hNRU1fU1JFVF9Y
X0xBU1QJCTMxCiAKKy8qIFNCSSBmdW5jdGlvbiBJRHMgZm9yIEZXIGZlYXR1cmUgZXh0ZW5zaW9u
ICovCisjZGVmaW5lIFNCSV9FWFRfRldGVF9TRVQJCTB4MAorI2RlZmluZSBTQklfRVhUX0ZXRlRf
R0VUCQkweDEKKworZW51bSBzYmlfZndmdF9mZWF0dXJlX3QgeworCVNCSV9GV0ZUX01JU0FMSUdO
RURfRVhDX0RFTEVHCQk9IDB4MCwKKwlTQklfRldGVF9MQU5ESU5HX1BBRAkJCT0gMHgxLAorCVNC
SV9GV0ZUX1NIQURPV19TVEFDSwkJCT0gMHgyLAorCVNCSV9GV0ZUX0RPVUJMRV9UUkFQCQkJPSAw
eDMsCisJU0JJX0ZXRlRfUFRFX0FEX0hXX1VQREFUSU5HCQk9IDB4NCwKKwlTQklfRldGVF9QT0lO
VEVSX01BU0tJTkdfUE1MRU4JCT0gMHg1LAorCVNCSV9GV0ZUX0xPQ0FMX1JFU0VSVkVEX1NUQVJU
CQk9IDB4NiwKKwlTQklfRldGVF9MT0NBTF9SRVNFUlZFRF9FTkQJCT0gMHgzZmZmZmZmZiwKKwlT
QklfRldGVF9MT0NBTF9QTEFURk9STV9TVEFSVAkJPSAweDQwMDAwMDAwLAorCVNCSV9GV0ZUX0xP
Q0FMX1BMQVRGT1JNX0VORAkJPSAweDdmZmZmZmZmLAorCisJU0JJX0ZXRlRfR0xPQkFMX1JFU0VS
VkVEX1NUQVJUCQk9IDB4ODAwMDAwMDAsCisJU0JJX0ZXRlRfR0xPQkFMX1JFU0VSVkVEX0VORAkJ
PSAweGJmZmZmZmZmLAorCVNCSV9GV0ZUX0dMT0JBTF9QTEFURk9STV9TVEFSVAkJPSAweGMwMDAw
MDAwLAorCVNCSV9GV0ZUX0dMT0JBTF9QTEFURk9STV9FTkQJCT0gMHhmZmZmZmZmZiwKK307CisK
KyNkZWZpbmUgU0JJX0ZXRlRfUExBVEZPUk1fRkVBVFVSRV9CSVQJCUJJVCgzMCkKKyNkZWZpbmUg
U0JJX0ZXRlRfR0xPQkFMX0ZFQVRVUkVfQklUCQlCSVQoMzEpCisKKyNkZWZpbmUgU0JJX0ZXRlRf
U0VUX0ZMQUdfTE9DSwkJCUJJVCgwKQorCiAvKiBTQkkgc3BlYyB2ZXJzaW9uIGZpZWxkcyAqLwog
I2RlZmluZSBTQklfU1BFQ19WRVJTSU9OX0RFRkFVTFQJMHgxCiAjZGVmaW5lIFNCSV9TUEVDX1ZF
UlNJT05fTUFKT1JfU0hJRlQJMjQKQEAgLTQxOSw2ICs0NDcsMTEgQEAgZW51bSBzYmlfZXh0X25h
Y2xfZmVhdHVyZSB7CiAjZGVmaW5lIFNCSV9FUlJfQUxSRUFEWV9TVEFSVEVEIC03CiAjZGVmaW5l
IFNCSV9FUlJfQUxSRUFEWV9TVE9QUEVEIC04CiAjZGVmaW5lIFNCSV9FUlJfTk9fU0hNRU0JLTkK
KyNkZWZpbmUgU0JJX0VSUl9JTlZBTElEX1NUQVRFCS0xMAorI2RlZmluZSBTQklfRVJSX0JBRF9S
QU5HRQktMTEKKyNkZWZpbmUgU0JJX0VSUl9USU1FT1VUCQktMTIKKyNkZWZpbmUgU0JJX0VSUl9J
TwkJLTEzCisjZGVmaW5lIFNCSV9FUlJfREVOSUVEX0xPQ0tFRAktMTQKIAogZXh0ZXJuIHVuc2ln
bmVkIGxvbmcgc2JpX3NwZWNfdmVyc2lvbjsKIHN0cnVjdCBzYmlyZXQgewotLSAKMi40OS4wCgoK
LS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
